CREATE SCHEMA link;

USE link;

CREATE TABLE
    category (
        id int AUTO_INCREMENT PRIMARY KEY,
        name varchar(225) NOT NULL COMMENT '名称',
        description varchar(225) NOT NULL COMMENT '描述'
    ) COMMENT '类别';

CREATE TABLE
    site (
        id int AUTO_INCREMENT PRIMARY KEY,
        name varchar(225) NOT NULL COMMENT '名称',
        url varchar(225) NOT NULL COMMENT '地址',
        icon varchar(225) NOT NULL COMMENT '图标',
        description varchar(225) NOT NULL COMMENT '地址',
        category_id int NOT NULL,
        CONSTRAINT site_category_id_fk FOREIGN KEY (category_id) REFERENCES category (id)
    ) COMMENT '位置';

INSERT INTO
    category (name, description)
VALUES
    ('官方文档', '主流框架和编程语言的官方文档'),
    ('博客站点', '技术博客和开发者社区');

INSERT INTO
    site (name, url, icon, description, category_id)
VALUES
    (
        'Vue',
        'https://cn.vuejs.org/',
        'https://cn.vuejs.org/logo.svg',
        'Vue 是一款用于构建用户界面的 JavaScript 框架。',
        1
    ),
    (
        'React',
        'https://react.dev/',
        'https://upload.wikimedia.org/wikipedia/commons/a/a7/React-icon.svg',
        'React 是一个用于构建用户界面的 JavaScript 库。',
        1
    ),
    (
        'Angular',
        'https://angular.io/',
        'https://angular.io/assets/images/logos/angular/angular.svg',
        'Angular 是一个用于构建移动端和桌面端 Web 应用的开发平台。',
        1
    ),
    (
        'Svelte',
        'https://svelte.dev/',
        'https://svelte.dev/svelte-logo-horizontal.svg',
        'Svelte 是一个编译型 JavaScript 框架，用于构建快速 Web 应用。',
        1
    ),
    (
        'Node.js',
        'https://nodejs.org/',
        'https://nodejs.org/static/images/logo.svg',
        'Node.js 是一个基于 Chrome V8 引擎的 JavaScript 运行时。',
        1
    ),
    (
        'Python',
        'https://www.python.org/',
        'https://www.python.org/static/img/python-logo.png',
        'Python 是一种广泛使用的高级编程语言。',
        1
    ),
    (
        'Java',
        'https://www.java.com/',
        'https://upload.wikimedia.org/wikipedia/en/3/30/Java_programming_language_logo.svg',
        'Java 是一种面向对象的编程语言，广泛应用于企业级开发。',
        1
    ),
    (
        'Go',
        'https://go.dev/',
        'https://go.dev/images/go-logo-blue.svg',
        'Go 是一种静态类型、编译型语言，设计用于构建简单、可靠、高效的软件。',
        1
    ),
    (
        'Rust',
        'https://www.rust-lang.org/',
        'https://www.rust-lang.org/static/images/rust-logo-blk.svg',
        'Rust 是一种系统编程语言，注重安全、速度和并发性。',
        1
    ),
    (
        'TypeScript',
        'https://www.typescriptlang.org/',
        'https://upload.wikimedia.org/wikipedia/commons/4/4c/Typescript_logo_2020.svg',
        'TypeScript 是 JavaScript 的超集，添加了静态类型定义。',
        1
    ),
    (
        'JavaScript',
        'https://developer.mozilla.org/zh-CN/docs/Web/JavaScript',
        'https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png',
        'JavaScript 是一种高级编程语言，用于创建动态交互式网页。',
        1
    ),
    (
        'PHP',
        'https://www.php.net/',
        'https://www.php.net/images/logos/php-logo.svg',
        'PHP 是一种广泛使用的开源通用脚本语言，特别适合 Web 开发。',
        1
    ),
    (
        'Ruby',
        'https://www.ruby-lang.org/',
        'https://www.ruby-lang.org/images/header-ruby-logo.png',
        'Ruby 是一种动态、开源的编程语言，注重简洁和生产力。',
        1
    ),
    (
        'C#',
        'https://learn.microsoft.com/zh-cn/dotnet/csharp/',
        'https://upload.wikimedia.org/wikipedia/commons/0/0d/C_Sharp_wordmark.svg',
        'C# 是一种现代、面向对象的编程语言，由 Microsoft 开发。',
        1
    ),
    (
        '.NET',
        'https://dotnet.microsoft.com/',
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/.NET_Core_Logo.svg',
        '.NET 是一个免费的、跨平台的、开源的开发者平台。',
        1
    ),
    (
        'Spring',
        'https://spring.io/',
        'https://spring.io/img/spring.svg',
        'Spring 是一个开源的 Java 应用框架，用于构建企业级应用。',
        1
    ),
    (
        'Django',
        'https://www.djangoproject.com/',
        'https://www.djangoproject.com/m/img/logos/django-logo-positive.svg',
        'Django 是一个高级 Python Web 框架，鼓励快速开发和简洁设计。',
        1
    ),
    (
        'Flask',
        'https://flask.palletsprojects.com/',
        'https://upload.wikimedia.org/wikipedia/commons/3/3c/Flask_logo.svg',
        'Flask 是一个轻量级的 Python Web 框架。',
        1
    ),
    (
        'Laravel',
        'https://laravel.com/',
        'https://laravel.com/img/logomark.min.svg',
        'Laravel 是一个用于 Web 开发的 PHP 框架，具有优雅的语法。',
        1
    ),
    (
        'Ruby on Rails',
        'https://rubyonrails.org/',
        'https://rubyonrails.org/assets/images/logo.svg',
        'Ruby on Rails 是一个全栈 Web 框架，使用 Ruby 语言。',
        1
    );

INSERT INTO
    site (name, url, icon, description, category_id)
VALUES
    (
        'CSDN',
        'https://www.csdn.net/',
        'https://www.csdn.net/favicon.ico',
        'CSDN 创立于1999年，是全球知名中文开发者网站，注册用户超过3500万，覆盖技术问答、博客分享、学习资源聚合等。',
        2
    ),
    (
        '掘金',
        'https://juejin.cn/',
        'https://juejin.cn/favicon.ico',
        '掘金是一个帮助开发者成长的社区，提供优质技术文章、实战教程和行业动态，涵盖前端、后端、Android、iOS等方向。',
        2
    ),
    (
        '博客园',
        'https://www.cnblogs.com/',
        'https://www.cnblogs.com/favicon.ico',
        '博客园创立于2004年，是一个面向开发者的知识分享社区，以纯净的阅读和写作氛围著称。',
        2
    ),
    (
        'InfoQ 中文',
        'https://www.infoq.cn/',
        'https://www.infoq.cn/favicon.ico',
        'InfoQ 是一个实践驱动、以社区为中心的技术媒体平台，聚焦架构设计、技术管理及前沿趋势。',
        22
    ),
    (
        'SegmentFault 思否',
        'https://segmentfault.com/',
        'https://segmentfault.com/favicon.ico',
        'SegmentFault 思否是中国新一代开发者社区和专业的技术媒体，以技术问答、专栏、课程为核心形态。',
        2
    ),
    (
        '开源中国',
        'https://www.oschina.net/',
        'https://www.oschina.net/favicon.ico',
        '开源中国成立于2008年，是目前中国最大的开源技术社区，收录全球知名开源项目近5万款。',
        2
    ),
    (
        'V2EX',
        'https://www.v2ex.com/',
        'https://www.v2ex.com/favicon.ico',
        'V2EX 是创意工作者们的社区，汇聚了超过40万名来自互联网、游戏和媒体行业的创意工作者。',
        2
    ),
    (
        '51CTO',
        'https://www.51cto.com/',
        'https://www.51cto.com/favicon.ico',
        '51CTO 是中国领先的IT技术学习和交流平台，提供技术专栏与视频教程，常有实战活动。',
        2
    ),
    (
        '阿里云开发者社区',
        'https://developer.aliyun.com/',
        'https://developer.aliyun.com/favicon.ico',
        '阿里云官方开发者社区，提供云计算、大数据、AI等领域的实战案例和技术专栏。',
        2
    ),
    (
        '腾讯云开发者社区',
        'https://cloud.tencent.com/developer',
        'https://cloud.tencent.com/favicon.ico',
        '腾讯云官方开发者社区，涵盖云原生、大数据、AI等领域的技术专栏与视频教程。',
        2
    ),
    (
        '美团技术团队',
        'https://tech.meituan.com/',
        'https://tech.meituan.com/favicon.ico',
        '美团技术团队官方博客，分享美团在分布式系统、算法、工程实践等方面的技术干货。',
        2
    ),
    (
        'Stack Overflow',
        'https://stackoverflow.com/',
        'https://stackoverflow.com/favicon.ico',
        'Stack Overflow 是全球最大的编程问答社区，拥有庞大的用户基础和丰富的问题库，是解决编程难题的首选之地。',
        2
    ),
    (
        'Dev.to',
        'https://dev.to/',
        'https://dev.to/favicon.ico',
        'Dev.to（DEV Community）是一个面向软件开发者的在线社区平台，拥有近389万注册开发者。',
        2
    ),
    (
        'Hacker News',
        'https://news.ycombinator.com/',
        'https://news.ycombinator.com/favicon.ico',
        'Hacker News 是计算机黑客和创业公司的社会化新闻网站，以技术讨论和深度评论著称。',
        2
    ),
    (
        'Medium',
        'https://medium.com/',
        'https://medium.com/favicon.ico',
        'Medium 是全球最大的独立写作与技术博客平台，汇聚了大量专家撰写的深度技术文章。',
        2
    ),
    (
        'Hashnode',
        'https://hashnode.com/',
        'https://hashnode.com/favicon.ico',
        'Hashnode 是面向开发者的博客平台，支持用户发布文章、搭建个人技术博客并建立技术品牌。',
        2
    ),
    (
        'Lobsters',
        'https://lobste.rs/',
        'https://lobste.rs/favicon.ico',
        'Lobsters 是一个邀请制技术社区，比 Hacker News 更小众、信噪比更高，适合高质量技术讨论。',
        2
    ),
    (
        'HackerNoon',
        'https://hackernoon.com/',
        'https://hackernoon.com/favicon.ico',
        'HackerNoon 是最大的科技、人工智能和编程语言资源平台之一，用户可以阅读专家文章或自行撰写。',
        2
    ),
    (
        'CodeProject',
        'https://www.codeproject.com/',
        'https://www.codeproject.com/favicon.ico',
        'CodeProject 是全球开发者的宝贵资源，用户可以在社区中分享经验、交流技术，获取各领域开发知识。',
        2
    ),
    (
        'DZone',
        'https://dzone.com/',
        'https://dzone.com/favicon.ico',
        'DZone 是世界上最大的在线开发者社区之一，涵盖编程、架构、DevOps、大数据等技术领域。',
        2
    );