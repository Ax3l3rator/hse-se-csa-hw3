# Отчет ДЗ№2

## Алексей Коледаев | БПИ-213 | Вариант 10

---

## [На 4](./4)

- [Решение на языке Си](./4/sol.c)
- Комментарии к [ассемблерной программе](./4/sol_asm.s), откомпилированной без оптимизирующих и отладочных опций успешно добавлены.
- Получена ассемблерная программа без лишних макросов за счет использования при компиляции из C соответствующих аргументов командной строки `gcc -O0 -masm=intel -fno-asynchronous-unwind-tables -fcf-protection=none -c /index.c -S -o ./beutiful_index.s`
- Модифицированная ассемблерная программа отдельно откомпилирована и скомпонована без использования опций отладки
- Имеется [тестовое покрытие](./tests/)

---

## [На 5](./5)

- В [программе на языке Си](./5/sol.c) используются функции с передачей данных через формальные параметры
- Внутри функций используются локальные переменные,
которые при компиляции отображаются на стек
- В ассемблерную программу добавлены поясняющие комментарии

---

## [На 6](./6)

- [Рефакторинг решения на ассемблере](./6/rasm.s)
- Добавлены комментарии
- [Тестовое покрытие](./tests/)

| Файл с рефактором  | Размер | Файл без рефактора     | Размер
| :-:        |:-      | :-:        |:-
| rasm.o    | 1.38 KB| sol.o    | 2.09 KB
| rasm      | 15.62KB| sol      | 15.72 KB

---

## [На 7](./7)

- Добавлено чтение из файла
- Реализация программы на ассемблере в виде двух единиц компиляции [findsum](./7/findsum.s) и [main](./7/main.s)
- [Файлы с данными](./tests/)

> Формат строки аргументов `--file [входной файл] [выходной файл]`

> Формат входных файлов: `число двойной точности(double)`

---

## [На 8](./8)

- Данные представлены в таблице, все программные требования выполнены в [папке](./8/)

Среднее время
Asm | C
:-:|:-:
0.000002s|0.000004s