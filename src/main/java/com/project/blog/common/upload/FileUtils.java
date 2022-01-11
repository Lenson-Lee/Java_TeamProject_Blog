package com.project.blog.common.upload;

import org.imgscalr.Scalr;
import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

//파일 업로드 관련 공통 처리를 위한 유틸 클래스
public class FileUtils {

    //이미지 구분을 위한 확장자 맵 만들기
    private static final Map<String, MediaType> mediaMap;

    static {
        mediaMap = new HashMap<>();
        mediaMap.put("JPG", MediaType.IMAGE_JPEG);
        mediaMap.put("GIF", MediaType.IMAGE_GIF);
        mediaMap.put("PNG", MediaType.IMAGE_PNG);
    }

    //확장자를 전달하면 해당 미디어타입을 리턴하는 메서드 (여기서는 JPG,GIF,PNG 만 사용하기 위함)
    public static MediaType getMediaType(String ext) {
        ext = ext.toUpperCase();

        //containsKey: 해당 맵에 해당 키가 있는지 참/거짓 확인
        if (mediaMap.containsKey(ext)) {
            return mediaMap.get(ext);
        } else {
            return null;
        }
    }

    //1. 사용자가 파일을 업로드했을 때 저장 처리 및 파일명을 리턴하는 메서드 throws 입출력실패오류
    public static String uploadFile(MultipartFile file, String uploadPath) throws IOException {

        //MultipartFile: 스프링 인터페이스. 큰 파일을 쪼개서 효율적으로 파일 업로드

        //중복없는 파일명으로 변환
        //UUID: 네트워크상에서 고유성이 보장되는 id를 만드는 표준규약
        //dog.jpg  ->  324342dfsdfsfdsfs-dfshlkjfdsh34234-dshjfslkdfh_dog.jpg
        String newFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

        //저장 경로에 날짜별 폴더를 생성
        //ex)  D:/developing/upload/2021/06/07
        String newUploadPath = getNewUploadPath(uploadPath);

        //업로드 수행
        //File 클래스
        //    ******(String parent, String child): parent 폴더 경로 child라는 파일에 대한 File객체 생성
        //          (File parent, String child): parent객체 폴더의 child라는 파일에 대한 File 객체 생성
        //          (String pathname): pathname에 해당되는 파일의 File객체를 생성
        //          (URI uri): file uri 경로에 파일의 File 객체를 생성한다.
        File uploadFile = new File(newUploadPath, newFileName);
        try {
            file.transferTo(uploadFile);
        } catch (IOException e) {
            //근원지를 찾아 단계별로 출력
            e.printStackTrace();
        }

        /*
         만약 업로드한 파일이 이미지파일이라면? 추가로 썸네일을 생성해서 저장하고
         해당 썸네일의 경로를 클라이언트에 응답 (저장은 원본, 보여주는건 썸네일)
         이미지가 아니라면?? 그냥 다운로드할 수 있게 일반 파일경로를 리턴턴
        */

        //클라이언트가 서버에 있는 파일을 로딩하려면 해당 파일이
        //어디에 저장되어있는지 정보가 필요하다. 따라서
        //중복되는 경로를 제외한(D:/~/upload) 경로를 리턴해야 함!
        //  응답할 파일명:  /2021/~~/파일명

        //ex)  D:/developing/upload/2021/06/07
        //File.separator: 프로그램이 실행 중인 OS에 해당하는 구분자를 리턴(OS별로 구분자 /, \, '' 등 다르기 때문)
        String responseFileName
                = newUploadPath.substring(uploadPath.length())
                + File.separator + newFileName;

        //이미지인지 확인하기 위해 확장자 추출
        String ext = getFileExtension(newFileName);

        if (getMediaType(ext) != null) {
            //이미지인 경우
            String thumbnailPath = makeThumbnail(newUploadPath, newFileName);
            return thumbnailPath.substring(uploadPath.length())
                    .replace("\\", "/");
        } else {
            //이미지가 아닌 경우
            return responseFileName.replace("\\", "/");
        }
    }

    //썸네일 이미지를 생성하여 저장하고 해당 저장경로를 반환하는 메서드
    private static String makeThumbnail(String newUploadPath, String newFileName) throws IOException {
        //원본이미지 읽어오기
        BufferedImage srcImg = ImageIO.read(new File(newUploadPath, newFileName));

        //# 썸네일 생성 작업
        //1. 원본이미지 리사이징
        BufferedImage destImg = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC
                , Scalr.Mode.FIT_TO_HEIGHT, 100);

        //2. 썸네일 이미지를 저장할 경로 생성
        String thumbnailPath = newUploadPath + File.separator + "s_" + newFileName;

        //3. 썸네일 이미지파일 객체 생성
        File newFile = new File(thumbnailPath);

        //4. 썸네일 이미지 서버에 저장
        ImageIO.write(destImg, getFileExtension(newFileName), newFile);

        //5. 썸네일 저장 경로 리턴
        return thumbnailPath;
    }

    //파일명에서 확장자를 추출해주는 메서드 + 마지막 '.' 다음 순서부터 나와서 jpg만 추출된다.
    public static String getFileExtension(String fileName) {
        //ex) fileName : dsf3fdsf33-dsfllkkj11-328743274_dog.jpg
        return fileName.substring(fileName.lastIndexOf(".") + 1);
    }

    //날짜별 폴더 생성 메서드
    private static String getNewUploadPath(String uploadPath) {
        LocalDate now = LocalDate.now();
        int y = now.getYear();
        int m = now.getMonthValue();
        int d = now.getDayOfMonth();

        //폴더 생성
        //valueOf():호 안의 해당 객체를 String 객체로 변환시키는 역할.
        String[] dateInfo = {String.valueOf(y), len2(m), len2(d)};
        for (String date : dateInfo) {
            //File.separator - 운영체제에 맞게 경로구분 문자열을 만들어줌
            // 윈도우 : \\ , 리눅스 : /
            uploadPath += File.separator + date;
            //이 경로대로 폴더 생성
            //mkdir 은 make directory의 약자이며 원하는 이름으로 디렉토리를 생성하게 해주는 명령어
            File directory = new File(uploadPath);
            if (!directory.exists()) {
                directory.mkdir();
            }
        }
        return uploadPath;
    }

    //한 자리수 월, 일을 항상 2자리로 만들어주는 메서드
    private static String len2(int n) {
        return n < 10 ? "0" + n : "" + n;
    }
}
