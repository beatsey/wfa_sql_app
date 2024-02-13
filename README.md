# СУБД для онлайн школы
Данный проект представляет собой графическое приложение с использованием Windows Forms Application (C#), который взаимодействует с базой данных, написанной на PostgreSQL.

При запуске появляется окно авторизации, которое ожидает на входе данные одно из пользователей из базы данных (таблица Users):
![Alt text](/screenshots/authorization.png?raw=true)

Стандартные пользователи (логин/пароль):
* user/user
* admin/admin
* teacher/teacher
* student/student

#### User
Обычный пользователь, который не является студентом. Доступен только просмотр существующих курсов и их описание:
![Alt text](/screenshots/userwindow.png?raw=true)

#### Admin
Может делать любые манипуляции по вставке, удалению и просмотру любой из таблиц базы данных.
![Alt text](/screenshots/adminwindow.png?raw=true)

#### Student
Студент имеет доступ к своему профилю с информацией о своей группе и преподавателе, а также видит все свои домашние работы и может загрузить ответ на соответствующее задание.
![Alt text](/screenshots/studentwindow.png?raw=true)

#### Teacher
Учитель может видеть все домашние работы по своим курсам, список своих групп, сводку по каждой учебной группе, принять/отказаться от учебной группы.
![Alt text](/screenshots/teacherwindow.png?raw=true)

Все взаимодействия с базой данных построены вокруг вызова хранимых процедур, а также select выражений.
Все данные экранированы при вставке, что исключает SQL инъекции.