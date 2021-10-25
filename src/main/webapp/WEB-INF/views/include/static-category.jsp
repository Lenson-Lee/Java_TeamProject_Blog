<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <div class="logo">
                    <h2><a href="/">My Blog</a></h2>
                </div>
            </div>
            <div class="col-md-10">
                <div class="menu">
                    <ul>
                        <li class=${flag == null ? 'active' : ''}><a href="/">홈</a></li>
                        <li class=${flag == 'movie' ? 'active' : ''}><a href="/board/movie-list">영화</a></li>
                        <li class=${flag == 'res' ? 'active' : ''}><a href="/board/restaurant-list">맛집</a></li>
                        <li class=${flag == 'day' ? 'active' : ''}><a href="/board/daily-list">일상</a></li>
                        <li><a href="/board/guest-book">전체</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>