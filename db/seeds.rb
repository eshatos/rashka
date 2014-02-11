# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Stat.create(people_left: 100500, shares_vk: 31624, shares_tw: 12352, shares_fb: 15434, shares_gp: 8657 )

salt = BCrypt::Engine.generate_salt
password = "qwerty"
Setting.create(login: "admin", password_salt: salt, password_hash: BCrypt::Engine.hash_secret(password, salt) )

PlaceType.create([{name: "Аэропорт"},
                  {name: "Порт"},
                  {name: "Вокзал"},
                  {name: "Граница"},
                  {name: "Автовокзал"}])

Place.create([{ name: 'Абакан', type_id: 1, lat: 53.74, lng: 91.385 },
              { name: 'Угольный', type_id: 1, lat: 64.734722, lng: 177.741389 },
              { name: 'Витязево', type_id: 1, lat: 45.001944, lng: 37.347222 },
              { name: 'Талаги', type_id: 1, lat: 64.600278, lng: 40.716667 },
              { name: 'Астрахань', type_id: 1, lat: 46.283056, lng: 48.006111 },
              { name: 'Барнаул', type_id: 1, lat: 53.363611, lng: 83.538333 },
              { name: 'Белгород', type_id: 1, lat: 50.643611, lng: 36.59 },
              { name: 'Игнатьево', type_id: 1, lat: 50.425278, lng: 127.412222 },
              { name: 'Братск', type_id: 1, lat: 56.370556, lng: 101.698056 },
              { name: 'Брянск', type_id: 1, lat: 53.214167, lng: 34.176389 },
              { name: 'Кневичи', type_id: 1, lat: 43.399167, lng: 132.151389 },
              { name: 'Беслан', type_id: 1, lat: 43.205, lng: 44.606667 },
              { name: 'Чертовицкое', type_id: 1, lat: 51.815, lng: 39.23 },
              { name: 'Грозный', type_id: 1, lat: 43.3882, lng: 45.699683 },
              { name: 'Кольцово', type_id: 1, lat: 56.75, lng: 60.8 },
              { name: 'Жиганск', type_id: 1, lat: 66.794167, lng: 123.3625 },
              { name: 'Иркутск', type_id: 1, lat: 52.265505, lng: 104.365654 },
              { name: 'Казань', type_id: 1, lat: 55.608333, lng: 49.277778 },
              { name: 'Храброво', type_id: 1, lat: 54.89, lng: 20.5925 },
              { name: 'Кемерово', type_id: 1, lat: 55.27, lng: 86.108333 },
              { name: 'Хурба', type_id: 1, lat: 50.405833, lng: 136.928889 },
              { name: 'Пашковский', type_id: 1, lat: 45.034444, lng: 39.15 },
              { name: 'Емельяново', type_id: 1, lat: 56.186111, lng: 92.475 },
              { name: 'Восточный', type_id: 1, lat: 51.751667, lng: 36.296667 },
              { name: 'Сокол', type_id: 1, lat: 59.911667, lng: 150.719444 },
              { name: 'Магнитогорск', type_id: 1, lat: 53.393333, lng: 58.756667 },
              { name: 'Уйташ', type_id: 1, lat: 42.816822, lng: 47.652294 },
              { name: 'Минеральные Воды', type_id: 1, lat: 44.225, lng: 43.083333 },
              { name: 'Внуково', type_id: 1, lat: 55.596111, lng: 37.2675 },
              { name: 'Домодедово', type_id: 1, lat: 55.408786, lng: 37.906314 },
              { name: 'Остафьево', type_id: 1, lat: 55.511667, lng: 37.507222 },
              { name: 'Раменское', type_id: 1, lat: 55.572778, lng: 38.14 },
              { name: 'Шереметьево', type_id: 1, lat: 55.972642, lng: 37.414589 },
              { name: 'Мурманск', type_id: 1, lat: 68.766667, lng: 32.733333 },
              { name: 'Нальчик', type_id: 1, lat: 43.5138, lng: 43.638275 },
              { name: 'Нижневартовск', type_id: 1, lat: 60.95, lng: 76.483333 },
              { name: 'Бегишево', type_id: 1, lat: 55.566667, lng: 52.1 },
              { name: 'Стригино', type_id: 1, lat: 56.23, lng: 43.786667 },
              { name: 'Спиченково', type_id: 1, lat: 53.81, lng: 86.878333 },
              { name: 'Толмачёво', type_id: 1, lat: 55.00996, lng: 82.66429 },
              { name: 'Омск-Центральный', type_id: 1, lat: 54.966667, lng: 73.316667 },
              { name: 'Оренбург-Центральный', type_id: 1, lat: 51.8, lng: 55.45 },
              { name: 'Орск', type_id: 1, lat: 51.066667, lng: 58.583333 },
              { name: 'Большое Савино', type_id: 1, lat: 57.931111, lng: 56.026667 },
              { name: 'Бесовец', type_id: 1, lat: 61.885, lng: 34.156667 },
              { name: 'Елизово', type_id: 1, lat: 53.166667, lng: 158.453611 },
              { name: 'Бухта Провидения', type_id: 1, lat: 64.384167, lng: -173.234722 },
              { name: 'Псков', type_id: 1, lat: 57.785, lng: 28.398333 },
              { name: 'Ростов-на-Дону', type_id: 1, lat: 47.258333, lng: 39.818333 },
              { name: 'Курумоч', type_id: 1, lat: 53.5, lng: 50.15 },
              { name: 'Пулково', type_id: 1, lat: 59.800278, lng: 30.2625 },
              { name: 'Саратов-Центральный', type_id: 1, lat: 51.565, lng: 46.046667 },
              { name: 'Адлер-Сочи', type_id: 1, lat: 43.443889, lng: 39.9425 },
              { name: 'Шпаковское', type_id: 1, lat: 45.1, lng: 42.1 },
              { name: 'Сургут', type_id: 1, lat: 61.341667, lng: 73.402778 },
              { name: 'Сыктывкар', type_id: 1, lat: 61.641667, lng: 50.838333 },
              { name: 'Богашёво', type_id: 1, lat: 56.383333, lng: 85.2 },
              { name: 'Рощино', type_id: 1, lat: 57.168333, lng: 65.316667 },
              { name: 'Мухино Байкал', type_id: 1, lat: 51.8075, lng: 107.4375 },
              { name: 'Ульяновск (Восточный)', type_id: 1, lat: 54.4, lng: 48.8 },
              { name: 'Уфа', type_id: 1, lat: 54.551111, lng: 55.868056 },
              { name: 'Хабаровск-Новый', type_id: 1, lat: 48.528056, lng: 135.188333 },
              { name: 'Ханты-Мансийск', type_id: 1, lat: 61.026111, lng: 69.096389 },
              { name: 'Чебоксары', type_id: 1, lat: 56.09, lng: 47.347222 },
              { name: 'Челябинск', type_id: 1, lat: 55.305, lng: 61.505 },
              { name: 'Череповец', type_id: 1, lat: 59.268333, lng: 38.018611 },
              { name: 'Кадала', type_id: 1, lat: 52.026667, lng: 113.305 },
              { name: 'Элиста', type_id: 1, lat: 46.373933, lng: 44.330872 },
              { name: 'Хомутово', type_id: 1, lat: 46.888611, lng: 142.7175 },
              { name: 'Якутск', type_id: 1, lat: 62.093333, lng: 129.771667 },
              { name: 'Туношна', type_id: 1, lat: 57.560667, lng: 40.157369 },
              {name: "Петропавловск-Камчатский", type_id: 2, lat: 53.001667, lng: 158.656944},
              {name: "Киевский вокзал", type_id: 3, lat: 54.668889, lng: 20.403889},
              {name: "Железнодорожный вокзал г. Сочи", type_id: 3, lat: 43.591183, lng: 39.72835},
              {name: "Торфяновка", type_id: 4, lat: 60.59500001, lng: 27.916666676667},
              {name: "Благовещенск-Хэйхэ", type_id: 4, lat: 50.238697, lng: 127.518175},
              {name: "Автовокзал г. Калининград", type_id: 5, lat: 54.693568, lng: 20.5018619},
              {name: "Автовокзал г. Белгород", type_id: 5, lat: 50.638799, lng: 36.571791}])

Reason.create([{text: "Президент ест детей", popularity: 100500},{text: "Страной правят геи", popularity: 12312},
               {text: "Как только въезжаю в страну, тут же начинается понос", popularity: 45675},
               {text: "Надоело жить в этой замечательной стране", popularity: 5},
               {text: "Страна осталась существовать где-то в середине 20 века", popularity: 5678},
               {text: "Как говорил когда-то мой дед, да хуй я на вас всех клал", popularity: 0},
               {text: "Хочу предаваться содомии и наркомании в другой стране, тут не кошерно", popularity: 6345},
               {text: "Не хочу попасть в тюрьму за просто так", popularity: 124},
               {text: "Все валят - тоже хочу", popularity: 7567},
               {text: "Пенис", popularity: 5689},
               {text: "1238141ФЫВАЫВАФЫВАФ№ЫВАП;", popularity: 6789},])

News.create([{title: "Хакеры от лица волгоградской прокуратуры заявили о запрете биткоин-бирж", text: "На сайте волгоградской прокуратуры в ночь на 4 февраля появилась новость об уголовном деле в отношении популярных обменников криптовалют. Позднее в ведомстве заявили, что пресс-релиз появился из-за хакерской атаки.", link: "http://tjournal.ru/paper/volograd-bitcoin"},
             {title: "Facebook отметила 10-летие, вспомнив главные события в истории сайта и пользователей", text: "К своему десятилетию компания Facebook запустила программу под названием «Взгляд в прошлое» (A Look Back), напомнив о главных событиях в истории социальной сети и ее пользователей. Об этом сообщает The Next Web.", link: "http://tjournal.ru/paper/facebook-look-back"},
             {title: "Плоские короткие шутки", text: "3 февраля сервис микроблогов Twitter выкатил новую версию дизайна своего сайта, главным заметным отличием которой стал единый стиль: белый и плоский фон у подложек, более тонкий шрифт у тектса, увеличенные элементы. Пользователи столкнулись с резким изменением и не поленились выразить недовольство, даже не меняя вкладку.", link: "http://tjournal.ru/paper/flat-twitter-rage"},
             {title: "РПЦ создаст организацию по контролю за распространением аниме", text: "Представители русской православной церкви Екатеринбурга планируют создать организацию, которая займется защитой детей от дурного влияния японской анимации. О этом сообщает местное информационное агентство «Политсовет».", link: "http://tjournal.ru/paper/no-more-anime"},
             {title: "Лучшие проекты на Kickstarter за неделю", text: "Игрушечные родственники, бесплатные фотооткрытки и анимационный фильм ужасов в подборке лучших проектов на Kickstarter. ", link: "http://tjournal.ru/paper/kickstarter-weekly11"},
             {title: "Владелец «Дождя» объявил о пресс-конференции по закрытию телеканала", text: "Владелец «Дождя» Александр Винокуров объявил о «фактическом закрытии телеканала», подробности которого станут известно 4 февраля на пресс-конференции. Об этом он сообщил у себя в твиттере.", link: "http://tjournal.ru/paper/tvrain-closing-press-conf"},
             {title: "Apple сняла на айфоны короткометражку к 30-летию Macintosh", text: "Компания Apple представила короткометражный фильм, посвящённый 30-летию компьютера Macintosh. Фильм и его описание опубликованы на сайте компании.", link: "http://tjournal.ru/paper/apple-30-years"},
             {title: "Супербоул-2014", text: "В ночь со 2 на 3 февраля по московскому времени прошла финальная игра за звание чемпиона Национальной футбольной лиги США — главное ежегодное телевизионное событие на местном телевидении. ", link: "http://tjournal.ru/paper/superbowl-2014"},
             {title: "Семилетняя девочка попросила Lego избавиться от сексистских стереотипов", text: "В сеть попало письмо семилетней девочки, которая обратилась к компании Lego с просьбой делать жизнь женских персонажей в наборах более увлекательной. Об этом сообщает британская Metro. ", link: "http://tjournal.ru/paper/letter-to-lego"},
             {title: "Создатель приложения для гей-знакомств пожаловался на «олимпийский» взлом", text: "Создатель приложения для гей-знакомств Hunters BBS сообщил о взломе десятков тысяч аккаунтов российских пользователей и рассылке им анонимных угроз. Атака связана с грядущей Олимпиадой в Сочи, говорится в поступившем в TJournal пресс-релизе.", link: "http://tjournal.ru/paper/gay-hack"},
             {title: "Подростки посвятили коллективный селфи стрельбе в московской школе", text: "Ученица московской школы №1459 Даша Иванова сфотографировалась с друзьями для Instagram, выразив свои чувства по поводу случившейся ранее утром трагедии. Подростки находились в соседнем здании со школой №263, где 3 февраля десятиклассник Сергей Гордеев убил полицейского и учителя географии.", link: "http://tjournal.ru/paper/schoolgirls-selfie"},
             {title: "Американец Тим Керби собирает деньги на игру про мутантов в России", text: "Американец, проживший в России 10 лет, собрал на Boomstarter 120 тысяч рублей на игру о нападении мутантов на территорию бывшего СССР. Для запуска игры ему необходима сумма в размере 600 тысяч рублей. ", link: "http://tjournal.ru/paper/mutants-in-russia"},
             {title: "Apple тестирует солнечные батареи и беспроводную зарядку для «умных часов»", text: "Apple рассматривает возможность встроить солнечную батарею в экран своих еще не анонсированных официально «умных часов». Об этом со ссылкой на источники внутри компании сообщает The New York Times.", link: "http://tjournal.ru/paper/iwatch-solar"}])