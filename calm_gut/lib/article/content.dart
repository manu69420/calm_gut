import 'package:flutter/material.dart';

const List<String> _enTitles = [
  "What is neurography?",
  "The Harmony Flow algorithm is the first step in neurography",
  "The \"Sun and Moon\” algorithm",
  "The Space Support algorithm",
  "Algorithm of Deep structures",
  "The Growth Point algorithm",
];

const List<String> _ruTitles = [
  "Что такое нейрографика?",
  "Алгоритм “Поток гармонии” — первый шаг в нейрографике",
  "Алгоритм “Солнце и Луна”",
  "Алгоритм Опора пространства",
  "Алгоритм Глубинные структуры",
  "Алгоритм Точка роста",
];

const List<String> _kkTitles = [
  "Нейрография дегеніміз не?",
  "Гармония Ағыны алгоритмі - нейрографиядағы алғашқы қадам болып табылады",
  "\"Күн Мен Ай\" алгоритмі",
  "Кеңістікті Қолдау алгоритмі",
  "Терең құрылымдар алгоритмі",
  "Өсу нүктесі алгоритмі",
];

List<Widget> _enContent(BuildContext context) => [
  Text(
    "Neurography is a drawing method that helps to express emotions, reduce stress, and put thoughts in order using lines and shapes. This creative approach combines art and psychology, allowing a person to harmonize their inner state without special artistic skills.",
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. Circles of feelings",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Start by drawing circles. Let them intersect, overlap each other. Draw until there is a feeling of \“enough\" inside.",
      ),
      Text(
        "2. The Triangle of Intent",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Draw a triangle in the center of the composition. It's a symbol of your purpose, strength, or decision. Let it be steady and clear.",
      ),
      Text(
        "3. Communication lines",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Connect the circles and the triangle with smooth, “neurographic” lines — without sharp angles, free as a stream of thought.",
      ),
      Text("4. Smoothing", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Look at where the lines intersect at an acute angle — and round off these places. This is how you create harmony and softness in the drawing and in yourself.",
      ),
      Text(
        "5. Color as a feeling",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Add color. Choose shades intuitively, without thinking too much. Let yourself color the emotions.",
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. Multiple circles",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Start with a lot of circles, big and small. They symbolize your emotions, desires, and events. Let them freely fill the space.",
      ),
      Text(
        "2. Squares of stability",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Add squares where you want support. They give structure and a sense of stability.",
      ),
      Text(
        "3. The Sun and the Moon",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Draw the Sun on one side — a source of energy, light and movement. Draw the moon on the other side — it holds secrets, gentleness and intuition. Or connect them in the center as a symbol of balance.",
      ),
      Text(
        "4. Communication and integrity",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Connect all the elements with smooth lines. Pay attention to how the Sun and Moon interact with the rest of the figures.",
      ),
      Text(
        "5. Strengthening",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Smooth out the sharp corners, strengthen the accents if you want. Add colors to enliven the composition — warmth, coolness, harmony.",
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. A large square",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Draw one large square that occupies almost the entire sheet. It's a symbol of your inner space and boundaries.",
      ),
      Text(
        "2. The elements inside",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Fill the square with circles, dots, and lines, as your intuition suggests. Let the shapes be free — big and small.",
      ),
      Text("3. Connection", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Connect all the elements with soft, flowing lines. Let them intertwine, as if creating a support network.",
      ),
      Text("4. Smoothing", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Round off all the sharp corners and intersections — where there is tension, add softness.",
      ),
      Text(
        "5. Color support",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Add colors if desired. Use shades that evoke a feeling of calmness, strength, or warmth.",
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. Two large squares",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Draw two large squares."),
      Text(
        "Draw each one slowly, over and over, along the contour. Stop when you feel it's enough.",
      ),
      Text(
        "2. Two inner matters",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Inside each square, draw two large shapes — these can be circles, waves, or abstract shapes.",
      ),
      Text(
        "Gradually trace them, strengthening the contour until you feel complete.",
      ),
      Text(
        "3. Two triangles",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Add two triangles."),
      Text(
        "Let them be stable. Slowly circle it until the shape becomes \"alive\" for you.",
      ),
      Text("4. Circles ", style: Theme.of(context).textTheme.headlineSmall),
      Text("Draw several circles of different sizes."),
      Text("Draw several circles of different sizes."),
      Text(
        "5. Smooth connections",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Connect everything together with flowing neurographic lines. Let the lines run through the shapes, connecting them.",
      ),
      Text("6. Smoothing", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Soften all the intersections and corners by rounding them off. Add harmony.",
      ),
      Text(
        "7. Color: cool harmony",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Color your work in cool colors: blue, purple, gray shades."),
      Text("Let the color enhance the feeling of depth, clarity and peace."),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. The central triangle",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Draw one large triangle in the center of the sheet."),
      Text(
        "Outline it smoothly, several times, until you feel that it is a support.",
      ),
      Text(
        "2. The spiral inside",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Draw a spiral in one of the parts of the drawing (inside or next to the triangle).",
      ),
      Text("Let it swirl freely, like a stream of energy or thoughts."),
      Text("3. Circles", style: Theme.of(context).textTheme.headlineSmall),
      Text("Add circles of different sizes."),
      Text(
        "Trace them along the contour until they feel full. Let them create movement around a triangle and a spiral.",
      ),
      Text(
        "4. Joining and strengthening",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Connect all the shapes together with smooth neurotrophic lines."),
      Text(
        "Where necessary, the lines are reinforced to give the structure stability.",
      ),
      Text("5. Smoothing", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Rounded off the sharp corners and intersections. Where there is tension, add softness.",
      ),
      Text(
        "6. Color according to mood",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Color it the way your gut tells you to."),
      Text(
        "If you want warmth, add yellow. I want peace of mind — blue. Let the color reflect your current state.",
      ),
    ],
  ),
];

List<Widget> _ruContent(BuildContext context) => [
  Text(
    "Нейрографика — это метод рисования, который помогает выразить эмоции, снизить стресс и привести мысли в порядок с помощью линий и форм. Этот творческий подход сочетает искусство и психологию, позволяя человеку гармонизировать внутреннее состояние без специальных художественных навыков.",
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("1. Круги чувств", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Начни с рисования кругов. Пусть они пересекаются, накладываются друг на друга. Рисуй до тех пор, пока внутри не появится ощущение “достаточно”.",
      ),
      Text(
        "2. Треугольник намерения",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "В центре композиции нарисуй треугольник. Это символ твоей цели, силы или решения. Пусть он будет устойчивым и чётким.",
      ),
      Text("3. Линии связи", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Соедини круги и треугольник плавными, “нейрографическими” линиями — без резких углов, свободными, как поток мысли.",
      ),
      Text("4. Сглаживание", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Посмотри, где линии пересекаются под острым углом — и закругли эти места. Так ты создаешь гармонию и мягкость в рисунке и в себе.",
      ),
      Text(
        "5. Цвет как чувство",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Добавь цвет. Выбирай оттенки интуитивно, не думая слишком много. Позволь себе раскрасить эмоции.",
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. Множество кругов",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Начни с большого количества кругов — больших и маленьких. Они символизируют твои эмоции, желания, события. Пусть они свободно заполняют пространство.",
      ),
      Text(
        "2. Квадраты стабильности",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Добавь квадраты — там, где хочется опоры. Они придают структуру и ощущение устойчивости.",
      ),
      Text(
        "3. Солнце и Луна",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Нарисуй Солнце с одной стороны — источник энергии, света и движения.",
      ),
      Text(
        "Нарисуй Луну с другой — она хранит тайны, мягкость и интуицию. Или соедини их в центре — как символ баланса.",
      ),
      Text(
        "4. Связь и целостность",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Соедини все элементы плавными линиями. Обрати внимание на то, как Солнце и Луна взаимодействуют с остальными фигурами.",
      ),
      Text("5. Укрепление", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Сгладь острые углы, усили акценты, если хочется. Добавь цвета, чтобы оживить композицию — тепло, прохлада, гармония.",
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. Большой квадрат",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Нарисуй один большой квадрат, занимающий почти весь лист. Это символ твоего внутреннего пространства и границ.",
      ),
      Text(
        "2. Элементы внутри",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Заполни квадрат кругами, точками, линиями, как подсказывает интуиция. Пусть формы будут свободными — большими и маленькими.",
      ),
      Text("3. Соединение", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Свяжи все элементы мягкими, текучими линиями. Позволь им переплетаться, будто создают сеть поддержки.",
      ),
      Text("4. Сглаживание", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Закругли все острые углы и пересечения — там, где напряжение, добавь мягкость.",
      ),
      Text(
        "5. Цветовая опора",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "При желании добавь цвета. Используй те оттенки, которые вызывают ощущение спокойствия, силы или тепла.",
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. Два больших квадрата",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Нарисуй два больших квадрата."),
      Text(
        "Обрисовывай каждый медленно, снова и снова, по контуру. Остановись, когда почувствуешь: достаточно.",
      ),
      Text(
        "2. Две внутренние материи",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Внутри каждого квадрата изобрази две крупные фигуры — это могут быть круги, волны, или абстрактные формы.",
      ),
      Text(
        "Постепенно обводи их, усиливая контур, пока не почувствуешь завершённость.",
      ),
      Text(
        "3. Два треугольника",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Добавь два треугольника."),
      Text(
        "Пусть они будут устойчивыми. Медленно обводи, пока форма не станет для тебя «живой».",
      ),
      Text("4. Круги ", style: Theme.of(context).textTheme.headlineSmall),
      Text("Нарисуй несколько кругов разного размера."),
      Text(
        "Каждый обрисовывай по спирали, по кругу — пока не появится ощущение наполненности.",
      ),
      Text(
        "5. Плавные связи",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Соедини всё между собой текучими нейрографическими линиями. Пусть линии проходят через формы, соединяя их.",
      ),
      Text("6. Сглаживание", style: Theme.of(context).textTheme.headlineSmall),
      Text("Все пересечения и углы смягчи — закругли их. Добавь гармонии."),
      Text(
        "7. Цвет: холодная гармония",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Раскрась работу в холодных тонах: синие, фиолетовые, серые оттенки.",
      ),
      Text("Пусть цвет усиливает ощущение глубины, ясности и покоя."),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. Центральный треугольник",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("В центре листа нарисуй один большой треугольник."),
      Text(
        "Обрисовывай его плавно, несколько раз, пока не почувствуешь: это — опора.",
      ),
      Text(
        "2. Спираль внутри",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "В одной из частей рисунка (внутри или рядом с треугольником) нарисуй спираль.",
      ),
      Text("Пусть она закручивается свободно, как поток энергии или мыслей."),
      Text("3. Круги", style: Theme.of(context).textTheme.headlineSmall),
      Text("Добавь круги разного размера."),
      Text(
        "Обводи их по контуру до ощущения полноты. Пусть они создают движение вокруг треугольника и спирали.",
      ),
      Text(
        "4. Соединение и укрепление",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Свяжи все фигуры между собой нейрографическими плавными линиями."),
      Text("Где нужно — усили линии, чтобы придать структуре устойчивость."),
      Text("5. Сглаживание", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Закругли острые углы и пересечения. Там, где напряжение — добавь мягкость.",
      ),
      Text(
        "6. Цвет по настроению",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Раскрась так, как подсказывает внутреннее чувство."),
      Text(
        "Хочется тепла — добавь жёлтый. Хочется спокойствия — синий. Пусть цвет отражает твое текущее состояние.",
      ),
    ],
  ),
];

List<Widget> _kkContent(BuildContext context) => [
  Text(
    "Нейрография - бұл сызықтар мен пішіндерді қолдана отырып, эмоцияларды білдіруге, стрессті азайтуға және ойларды ретке келтіруге көмектесетін сурет салу әдісі. Бұл шығармашылық тәсіл өнер мен психологияны ұштастыра отырып, адамға өзінің ішкі күйін ерекше көркемдік шеберліксіз үйлестіруге мүмкіндік береді.",
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. Сезім шеңберлері",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Шеңберлерді салудан бастаңыз. Олардың қиылысуына, қабаттасуына мүмкіндік беріңіз. Ішінде \"жеткілікті\" сезім пайда болғанша сурет салыңыз.",
      ),
      Text(
        "2. Ниет Үшбұрышы",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Композицияның ортасына үшбұрыш салыңыз. Бұл сіздің мақсатыңыздың, күшіңіздің немесе шешіміңіздің символы. Ол тұрақты және түсінікті болсын.",
      ),
      Text(
        "3. Байланыс желілері",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Шеңберлер мен үшбұрышты тегіс, \"нейрографиялық\" сызықтармен байланыстырыңыз — өткір бұрыштары жоқ, ой ағыны сияқты еркін.",
      ),
      Text("4. Тегістеу", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Сызықтардың өткір бұрышпен қиылысатын жеріне қараңыз-және осы жерлерді дөңгелектеңіз. Осылайша сіз сызбада және өзіңізде үйлесімділік пен жұмсақтықты жасайсыз.",
      ),
      Text(
        "5. Түс сезім ретінде",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Түс қосыңыз. Реңктерді интуитивті түрде, көп ойланбастан таңдаңыз. Өзіңізге эмоцияларды бояуға рұқсат етіңіз.",
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. Бірнеше шеңбер",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Үлкен және кіші шеңберлерден бастаңыз. Олар сіздің эмоцияларыңызды, тілектеріңізді, оқиғаларыңызды бейнелейді. Олар кеңістікті еркін толтырсын.",
      ),
      Text(
        "2. Тұрақтылық квадраттары",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Қолдау қажет квадраттарды қосыңыз. Олар құрылым мен тұрақтылық сезімін береді.",
      ),
      Text("3. Күн Мен Ай", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Күнді бір жағына сызыңыз-энергия, жарық және қозғалыс көзі. Екінші жағынан айды сызыңыз-оның құпиялары, жұмсақтығы мен түйсігі бар. Немесе оларды тепе-теңдіктің символы ретінде ортаға қосыңыз.",
      ),
      Text(
        "4. Байланыс және тұтастық",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Барлық элементтерді тегіс сызықтармен қосыңыз. Күн мен Айдың қалған фигуралармен қалай әрекеттесетініне назар аударыңыз.",
      ),
      Text("5. Күшейту", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Өткір бұрыштарды тегістеңіз, қаласаңыз, екпіндерді күшейтіңіз. Композицияны жандандыру үшін түстерді қосыңыз — жылулық, салқындық, үйлесімділік.",
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("1. Үлкен шаршы", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Бүкіл парақты дерлік алып жатқан бір үлкен шаршыны сызыңыз. Бұл сіздің ішкі кеңістігіңіз бен шекараңыздың символы.",
      ),
      Text(
        "2. Ішіндегі элементтер",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Сіздің түйсігіңіз көрсеткендей, шаршыны шеңберлермен, нүктелермен және сызықтармен толтырыңыз. Пішіндер бос болсын-үлкен және кіші.",
      ),
      Text("3. Қосылу", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Барлық элементтерді жұмсақ, ағынды сызықтармен қосыңыз. Қолдау желісін жасағандай, олардың тоғысуына мүмкіндік беріңіз.",
      ),
      Text("4. Тегістеу", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Барлық өткір бұрыштар мен қиылыстарды дөңгелектеңіз — кернеу бар жерде жұмсақтық қосыңыз.",
      ),
      Text("5. Түсті қолдау", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Қажет болса, түстерді қосыңыз. Тыныштық, күш немесе жылулық сезімін тудыратын реңктерді қолданыңыз.",
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. Екі үлкен шаршы",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Екі үлкен квадрат сызыңыз."),
      Text(
        "Әрқайсысын контур бойымен баяу, қайта-қайта сызыңыз. Бұл жеткілікті деп ойлаған кезде тоқтаңыз.",
      ),
      Text(
        "2. Екі ішкі мәселе",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Әр шаршының ішіне екі үлкен пішінді салыңыз — бұл шеңберлер, толқындар немесе дерексіз пішіндер болуы мүмкін.",
      ),
      Text(
        "Толық сезінгенше контурды нығайта отырып, оларды біртіндеп қадағалаңыз.",
      ),
      Text("3. Екі үшбұрыш", style: Theme.of(context).textTheme.headlineSmall),
      Text("Екі үшбұрыш қосыңыз."),
      Text(
        "Олар тұрақты болсын. Пішін сіз үшін \"тірі\" болғанша оны баяу айналдырыңыз.",
      ),
      Text("4. Үйірмелер ", style: Theme.of(context).textTheme.headlineSmall),
      Text("Әр түрлі өлшемдегі бірнеше шеңбер сызыңыз."),
      Text(
        "Әрқайсысын спиральмен, шеңбермен, толықтық сезімі пайда болғанша сызыңыз.",
      ),
      Text(
        "5. Тегіс байланыстар",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Барлығын ағынды нейрографиялық сызықтармен біріктіріңіз. Сызықтарды пішіндер арқылы өткізіп, оларды байланыстырыңыз.",
      ),
      Text("6. Тегістеу", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Барлық қиылыстар мен бұрыштарды дөңгелектеу арқылы жұмсартыңыз. Үйлесімділік қосыңыз.",
      ),
      Text(
        "7. Түсі: салқын үйлесімділік",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Жұмысыңызды салқын түстермен бояңыз: көк, күлгін, сұр реңктер."),
      Text("Түс тереңдік, айқындық және тыныштық сезімін арттырсын."),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "1. Орталық үшбұрыш",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Парақтың ортасына бір үлкен үшбұрыш салыңыз."),
      Text("Оның тірек екенін сезгенше, оны бірнеше рет тегіс етіп сызыңыз."),
      Text(
        "2. Ішіндегі спираль",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Сызбаның бір бөлігіне спираль сызыңыз (үшбұрыштың ішінде немесе жанында).",
      ),
      Text("Ол энергия немесе ой ағыны сияқты еркін айналсын."),
      Text("3. Үйірмелер", style: Theme.of(context).textTheme.headlineSmall),
      Text("Әр түрлі өлшемдегі шеңберлерді қосыңыз."),
      Text(
        "Толық сезінгенше оларды контур бойымен сызыңыз. Олар үшбұрыш пен спиральдың айналасында қозғалыс жасасын.",
      ),
      Text(
        "4. Қосылу және нығайту",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Барлық пішіндерді тегіс нейротрофиялық сызықтармен біріктіріңіз."),
      Text(
        "Қажет болса, құрылымның тұрақтылығын қамтамасыз ету үшін сызықтар күшейтіледі.",
      ),
      Text("5. Тегістеу", style: Theme.of(context).textTheme.headlineSmall),
      Text(
        "Өткір бұрыштар мен қиылыстарды дөңгелектеді. Кернеу бар жерде жұмсақтық қосыңыз.",
      ),
      Text(
        "6. Көңіл-күйге сәйкес түс",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text("Оны ішектеріңіз айтқандай бояңыз."),
      Text(
        "Егер сіз жылуды қаласаңыз, сары түсті қосыңыз. Мен жан тыныштығын қалаймын-көк. Түс сіздің қазіргі күйіңізді көрсетсін.",
      ),
    ],
  ),
];

class Content {
  Text getTitle({
    required int index,
    required String? locale,
    TextStyle? style,
  }) {
    return switch (locale) {
      "ru" => Text(_ruTitles[index], style: style),
      "kk" => Text(_kkTitles[index], style: style),
      _ => Text(_enTitles[index], style: style),
    };
  }

  Widget getContent({
    required int index,
    required String? locale,
    required BuildContext context,
  }) {
    return switch (locale) {
      "ru" => _ruContent(context)[index],
      "kk" => _kkContent(context)[index],
      _ => _enContent(context)[index],
    };
  }
}
