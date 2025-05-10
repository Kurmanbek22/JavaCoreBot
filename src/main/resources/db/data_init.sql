INSERT INTO topics (id, title)
VALUES
    (1, 'Основы языка Java'),
    (2, 'Объектно-Ориентированное Программирование'),
    (3, 'Исключения'),
    (4, 'Коллекции'),
    (5, 'Потоки и многозадачность'),
    (6, 'Java 8 и новые возможности'),
    (7, 'JVM и сборка мусора'),
    (8, 'Работа с базами данных и JDBC'),
    (9, 'Модульное тестирование'),
    (10, 'Работа с файлами и вводом/выводом'),
    (11, 'Spring Framework'),
    (12, 'Работа с сетью и HTTP');

INSERT INTO subtopics (id, topic_id, title, explanation) VALUES
-- Основы языка Java
(1, 1, 'Переменные и типы данных', 'Переменные могут быть примитивными и ссылочными типами, такими как int, String и другие. Примеры примитивных типов: int, double, boolean. Примеры ссылочных типов: String, массивы, объекты классов.'),
(2, 1, 'Операторы', 'Операторы позволяют выполнять различные операции, такие как арифметические, логические и операторы сравнения. Например, арифметический оператор "+", логический "&&", оператор сравнения "==". Пример кода: \n```java\nint a = 5, b = 10;\nint sum = a + b;\nSystem.out.println("Сумма: " + sum);\n```'),

-- ООП
(3, 2, 'Инкапсуляция', 'Инкапсуляция скрывает внутренние данные объекта и предоставляет доступ к ним через методы. Пример кода: \n```java\nclass Person {\n private String name;\n public String getName() {\n return name;\n }\n public void setName(String name) {\n this.name = name;\n }\n}\nPerson person = new Person();\nperson.setName("John");\nSystem.out.println(person.getName());\n```'),
(4, 2, 'Наследование', 'Наследование позволяет создавать новые классы на основе существующих, повторно используя их код. Пример кода: \n```java\nclass Animal {\n void makeSound() {\n System.out.println("Animal makes a sound");\n }\n}\nclass Dog extends Animal {\n void makeSound() {\n System.out.println("Bark");\n }\n}\nDog dog = new Dog();\ndog.makeSound();\n```'),
(5, 2, 'Полиморфизм', 'Полиморфизм позволяет объектам разных типов реагировать на одно и то же сообщение по-разному. Пример кода: \n```java\nclass Animal {\n void makeSound() {\n System.out.println("Animal makes a sound");\n }\n}\nclass Dog extends Animal {\n void makeSound() {\n System.out.println("Bark");\n }\n}\nclass Cat extends Animal {\n void makeSound() {\n System.out.println("Meow");\n }\n}\nAnimal animal = new Dog();\nanimal.makeSound();\nanimal = new Cat();\nanimal.makeSound();\n```'),
(6, 2, 'Абстракция', 'Абстракция позволяет скрыть детали реализации и предоставить только важную информацию для пользователя объекта. Пример кода: \n```java\nabstract class Shape {\n abstract void draw();\n}\nclass Circle extends Shape {\n void draw() {\n System.out.println("Drawing Circle");\n }\n}\nShape shape = new Circle();\nshape.draw();\n```'),

-- Исключения
(7, 3, 'Try-Catch', 'Try-Catch используется для обработки исключений в Java. Пример кода: \n```java\ntry {\n int result = 10 / 0;\n} catch (ArithmeticException e) {\n System.out.println("Ошибка: деление на ноль");\n}\n```'),
(8, 3, 'Custom Exceptions', 'Создание пользовательских исключений позволяет создавать свои типы ошибок в программе. Пример кода: \n```java\nclass MyException extends Exception {\n public MyException(String message) {\n super(message);\n }\n}\ntry {\n throw new MyException("Моя ошибка");\n} catch (MyException e) {\n System.out.println(e.getMessage());\n}\n```'),
(9, 3, 'Throw и throws', 'Throw используется для явного выбрасывания исключений, а throws указывает, что метод может их выбросить. Пример кода: \n```java\nvoid checkAge(int age) throws IllegalArgumentException {\n if (age < 18) {\n throw new IllegalArgumentException("Возраст должен быть не менее 18 лет");\n }\n}\ntry {\n checkAge(16);\n} catch (IllegalArgumentException e) {\n System.out.println(e.getMessage());\n}\n```'),

-- Коллекции
(10, 4, 'List vs Set', 'List и Set — это коллекции, одна из которых допускает дубли (List), а другая — нет (Set). Пример кода: \n```java\nList<String> list = new ArrayList<>();\nlist.add("apple");\nlist.add("banana");\nlist.add("apple");\nSet<String> set = new HashSet<>(list);\nSystem.out.println("List: " + list);\nSystem.out.println("Set: " + set);\n```'),
(11, 4, 'Map', 'Map используется для хранения пар ключ-значение. Пример кода: \n```java\nMap<String, Integer> map = new HashMap<>();\nmap.put("apple", 5);\nmap.put("banana", 10);\nSystem.out.println("Ключ: apple, значение: " + map.get("apple"));\n```'),
(12, 4, 'Queue', 'Queue — это структура данных, работающая по принципу FIFO (First In First Out). Пример кода: \n```java\nQueue<Integer> queue = new LinkedList<>();\nqueue.add(1);\nqueue.add(2);\nqueue.add(3);\nSystem.out.println(queue.poll());\n```'),
(13, 4, 'Deque', 'Deque позволяет работать с коллекцией как с очередью и стеком (с двух концов). Пример кода: \n```java\nDeque<Integer> deque = new ArrayDeque<>();\ndeque.addFirst(1);\ndeque.addLast(2);\nSystem.out.println(deque.pollFirst());\n```'),
(14, 4, 'Iterator', 'Iterator используется для обхода коллекции без указания индексов или ключей. Пример кода: \n```java\nList<String> list = Arrays.asList("apple", "banana", "cherry");\nIterator<String> iterator = list.iterator();\nwhile (iterator.hasNext()) {\n System.out.println(iterator.next());\n}\n```'),

-- Потоки и многозадачность
(15, 5, 'Thread vs Runnable', 'Thread и Runnable — два способа создания многозадачности в Java. Пример с Thread: \n```java\nclass MyThread extends Thread {\n public void run() {\n System.out.println("Thread is running");\n }\n}\nMyThread thread = new MyThread();\nthread.start();\n``` Пример с Runnable: \n```java\nclass MyRunnable implements Runnable {\n public void run() {\n System.out.println("Runnable is running");\n }\n}\nThread thread = new Thread(new MyRunnable());\nthread.start();\n```'),
(16, 5, 'Synchronized', 'Synchronized используется для синхронизации потоков, предотвращая одновременный доступ к ресурсам. Пример кода: \n```java\nclass Counter {\n private int count = 0;\n public synchronized void increment() {\n count++;\n }\n public int getCount() {\n return count;\n }\n}\nCounter counter = new Counter();\nThread thread1 = new Thread(() -> counter.increment());\nThread thread2 = new Thread(() -> counter.increment());\nthread1.start();\nthread2.start();\n```'),

-- Java 8 и новые возможности
(20, 6, 'Лямбда-выражения', 'Лямбда-выражения позволяют создавать анонимные функции для более компактного кода. Пример кода: \n```java\nList<String> names = Arrays.asList("Alice", "Bob", "Charlie");\nnames.forEach(name -> System.out.println(name));\n```'),
(21, 6, 'Stream API', 'Stream API используется для работы с коллекциями и позволяет выполнять операции на данных в функциональном стиле. Пример кода: \n```java\nList<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);\nnumbers.stream().filter(n -> n % 2 == 0).forEach(System.out::println);\n```'),

-- JVM и сборка мусора
(22, 7, 'JVM', 'JVM (Java Virtual Machine) — это виртуальная машина, которая исполняет байт-код Java. Она управляет памятью, обеспечивает переносимость и безопасность. Пример: JVM позволяет запускать Java-программу на разных операционных системах, не меняя исходный код.'),
(23, 7, 'Сборщик мусора', 'Сборщик мусора (Garbage Collector) отвечает за автоматическое управление памятью в Java, удаляя объекты, которые больше не используются. Это помогает избежать утечек памяти. Пример работы: JVM автоматически освобождает память, когда объект больше не имеет ссылок.'),

-- Работа с базами данных и JDBC
(24, 8, 'JDBC (Java Database Connectivity)', 'JDBC — это API, которое позволяет Java-программам взаимодействовать с базами данных. Через JDBC можно выполнять SQL-запросы, получать и обновлять данные. Пример кода: \n```java\nConnection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "user", "password");\nStatement stmt = conn.createStatement();\nResultSet rs = stmt.executeQuery("SELECT * FROM users");\nwhile (rs.next()) {\n System.out.println(rs.getString("name"));\n}\n```'),
(25, 8, 'PreparedStatement', 'PreparedStatement используется для выполнения параметризованных SQL-запросов, что помогает избежать SQL-инъекций и повышает производительность. Пример кода: \n```java\nPreparedStatement pstmt = conn.prepareStatement("INSERT INTO users (name, age) VALUES (?, ?)");\npstmt.setString(1, "John");\npstmt.setInt(2, 25);\npstmt.executeUpdate();\n```'),

-- Модульное тестирование
(26, 9, 'JUnit', 'JUnit — это фреймворк для модульного тестирования в Java. Он позволяет создавать тесты для отдельных компонентов программы и проверять их корректную работу. Пример кода: \n```java\nimport org.junit.Test;\nimport static org.junit.Assert.*;\n\npublic class CalculatorTest {\n @Test\n public void testAddition() {\n Calculator calc = new Calculator();\n assertEquals(5, calc.add(2, 3));\n }\n}\n```'),
(27, 9, 'Mockito', 'Mockito — это библиотека для создания заглушек (mock) и проверки взаимодействий между объектами в тестах. Пример кода: \n```java\nimport static org.mockito.Mockito.*;\n\nList<String> mockedList = mock(List.class);\nmockedList.add("Hello");\nverify(mockedList).add("Hello");\n```'),

-- Spring Framework
(28, 11, 'Spring Core', 'Spring Core — это ядро фреймворка Spring, которое включает в себя контейнер для управления зависимостями (IoC). Пример кода: \n```java\n@Configuration\nclass AppConfig {\n @Bean\n public MyService myService() {\n return new MyService();\n }\n}\n\npublic class MyService {\n public void doSomething() {\n System.out.println("Doing something");\n }\n}\n```'),
(29, 11, 'Spring Boot', 'Spring Boot — это фреймворк для быстрого создания и запуска приложений на основе Spring. Он автоматизирует множество конфигураций, обеспечивая простоту в разработке. Пример кода: \n```java\n@SpringBootApplication\npublic class Application {\n public static void main(String[] args) {\n SpringApplication.run(Application.class, args);\n }\n}\n```'),
-- Работа с сетью и HTTP
(30, 12, 'HTTP-запросы', 'HTTP-запросы в Java можно отправлять с использованием библиотек, таких как HttpURLConnection или библиотеки высокого уровня, например, Apache HttpClient. Пример кода с HttpURLConnection: \n```java\nURL url = new URL("http://example.com");\nHttpURLConnection connection = (HttpURLConnection) url.openConnection();\nconnection.setRequestMethod("GET");\nint responseCode = connection.getResponseCode();\nSystem.out.println("Response Code: " + responseCode);\n```'),
(31, 12, 'RESTful Web Services', 'RESTful Web Services — это архитектурный стиль для создания веб-сервисов, использующих HTTP. Spring Boot идеально подходит для создания RESTful API. Пример кода с использованием Spring Boot: \n```java\n@RestController\n@RequestMapping("/api")\npublic class MyController {\n @GetMapping("/hello")\n public String sayHello() {\n return "Hello, World!";\n }\n}\n```'),
(32, 10, 'File I/O', 'File I/O позволяет читать и записывать данные в файлы, используя классы из пакета java.io. Пример кода: \n```java\nimport java.io.FileWriter;\nimport java.io.IOException;\n\ntry (FileWriter writer = new FileWriter("example.txt")) {\n writer.write("Hello, world!");\n} catch (IOException e) {\n e.printStackTrace();\n}\n```'),
(33, 10, 'BufferedReader', 'BufferedReader используется для эффективного чтения текста из потока ввода. Пример кода: \n```java\nimport java.io.BufferedReader;\nimport java.io.FileReader;\nimport java.io.IOException;\n\ntry (BufferedReader reader = new BufferedReader(new FileReader("example.txt"))) {\n String line;\n while ((line = reader.readLine()) != null) {\n System.out.println(line);\n }\n} catch (IOException e) {\n e.printStackTrace();\n}\n```');
