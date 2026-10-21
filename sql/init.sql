SET NAMES utf8mb4;

CREATE SCHEMA link CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE link;

CREATE TABLE
    category (
        id int AUTO_INCREMENT PRIMARY KEY,
        name varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
        description varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述'
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '类别';

CREATE TABLE
    site (
        id int AUTO_INCREMENT PRIMARY KEY,
        name varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
        url varchar(225) NOT NULL COMMENT '地址',
        icon varchar(225) NOT NULL COMMENT '图标',
        description varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
        category_id int NOT NULL,
        CONSTRAINT site_category_id_fk FOREIGN KEY (category_id) REFERENCES category (id)
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '位置';

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
        'https://svelte.dev/favicon.png',
        'Svelte 是一个编译型 JavaScript 框架，用于构建快速 Web 应用。',
        1
    ),
    (
        'Node.js',
        'https://nodejs.org/',
        'https://nodejs.org/static/images/favicons/favicon.png',
        'Node.js 是一个基于 Chrome V8 引擎的 JavaScript 运行时。',
        1
    ),
    (
        'Python',
        'https://www.python.org/',
        'https://www.python.org/static/favicon.ico',
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
        'https://go.dev/images/favicon-gopher.png',
        'Go 是一种静态类型、编译型语言，设计用于构建简单、可靠、高效的软件。',
        1
    ),
    (
        'Rust',
        'https://www.rust-lang.org/',
        'https://rust-lang.org/static/images/favicon.svg',
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
        'https://www.php.net/favicon-32x32.png?v=2',
        'PHP 是一种广泛使用的开源通用脚本语言，特别适合 Web 开发。',
        1
    ),
    (
        'Ruby',
        'https://www.ruby-lang.org/',
        'https://www.ruby-lang.org//favicon.ico',
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
        'https://static.djangoproject.com/img/icon-touch.e4872c4da341.png',
        'Django 是一个高级 Python Web 框架，鼓励快速开发和简洁设计。',
        1
    ),
    (
        'Flask',
        'https://flask.palletsprojects.com/',
        'https://flask.palletsprojects.com/en/stable/_static/flask-icon.svg',
        'Flask 是一个轻量级的 Python Web 框架。',
        1
    ),
    (
        'Laravel',
        'https://laravel.com/',
        'https://rubyonrails.org/assets/images/favicon.png',
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
        'https://static001.infoq.cn/static/infoq/www/img/share-default-5tgbiuhgfefgujjhg.png',
        'InfoQ 是一个实践驱动、以社区为中心的技术媒体平台，聚焦架构设计、技术管理及前沿趋势。',
        2
    ),
    (
        'Google For Developers',
        'https://developers.google.cn/community?hl=zh-cn',
        'https://www.gstatic.cn/devrel-devsite/prod/v097103d8ccd7b257790809ea4cc5e5fee6daa6e24890a4af388296e58364bc31/developers/images/favicon-new.png',
        'Google for Developers是谷歌为开发者提供的官方资源平台',
        2
    ),
    (
        '知乎',
        'https://www.zhihu.com/',
        'https://static.zhihu.com/heifetz/assets/apple-touch-icon-152.81060cab.png',
        '知乎，中文互联网高质量的问答社区和创作者聚集的原创内容平台',
        2
    ),
    (
        'unity',
        'https://developer.unity.cn/',
        'https://developer-prd.cdn.unity.cn/images/favicons/favicon_cn.ico?v=3',
        'Unity User Group（UUG）是 Unity 开发者的专属社区活动',
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
        'https://p0.meituan.net/meituantechblog/00c62e57b4c4a1f40b47d7152b3e54b511963.png',
        '美团技术团队官方博客，分享美团在分布式系统、算法、工程实践等方面的技术干货。',
        2
    ),
    (
        'Stack Overflow',
        'https://stackoverflow.com/',
        'https://stackoverflow.com/Content/Sites/stackoverflow/Img/apple-touch-icon.png?v=9168b8ec82a5',
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
        'npm',
        'https://www.npmjs.com/',
        'https://static-production.npmjs.com/da3ab40fb0861d15c83854c29f5f2962.png',
        '是 Node.js 的默认 JavaScript 包管理工具，用于安装、管理和共享项目依赖库。',
        2
    ),
    (
        '菜鸟教程',
        'https://www.runoob.com/',
        'https://www.runoob.com/pwa/icon-192.png',
        '菜鸟教程是一个面向初学者的免费在线编程技术学习网站，提供多种编程语言和技术的基础教程及在线实例',
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
        'github',
        'https://github.com/',
        'https://github.githubassets.com/favicons/favicon.svg',
        'GitHub 是一个平台，支持整个软件开发过程，从规划工作到部署和操作软件。 GitHub 是用于构建软件的平台',
        2
    ),
    (
        'DZone',
        'https://dzone.com/',
        'https://dz2cdn1.dzone.com/themes/dz20/images/favicon.png',
        'DZone 是世界上最大的在线开发者社区之一，涵盖编程、架构、DevOps、大数据等技术领域。',
        2
    );