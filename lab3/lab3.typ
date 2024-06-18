#import "@docs/bmstu:1.0.0":*
#import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx, cellx
#show: student_work.with(
  caf_name: "Компьютерные системы и сети",
  faculty_name: "Информатика и системы управления",
  work_type: "лабораторной работе",
  work_num: "3",
  discipline_name: "Электроника",
  theme: "Ключевой режим работы транзистора (Вариант 13)",
  author: (group: "ИУ6-42Б", nwa: "А. П. Плютто"),
  adviser: (nwa: "Н. В. Аксенов"),
  city: "Москва",
  table_of_contents: true,
)


= Задание

== Цель работы

Исследовать статические режимы и переходные процессы в схеме простого транзисторного ключа.

#v(-10pt)
== Параметры схемы

#set text(9pt)
#align(center)[
  #tablex(
    columns: 16,
    inset: 2pt,
    align: center+horizon,
    [$№$],[$R_б$, Ом],[$B$],[$B_r$],[$I_s$, A],[$C_"бк"$, Ф],[$C_"бэ"$, Ф],[$tau_r$, c],[$r_б$, Ом],[$F_alpha$, Гц],[$R_к$, Ом],[$E_"см"$, В],[$R_"см"$, Ом],[$U_"бэ"$, В],[$E_"вх"$, В], [$E_к$, В],
    [13],[40000],[120],[0,95],[1,00E-12],[1,50E-11],[7,50E-12],[2,40E-05],[30],[2,50E+06],[2200],[1,4],[32500],[0,75],[11],[11]
  )
]
#set text(14pt)

= Часть 1

Схема транзисторного ключа показана на рисунке 1:

#img(image("1.png", width:90%), [Схема 1])

Приведённая схема расчёта тока базы показана на рисунке 2:
#img(image("2.png", width:90%), [Схема 2])

По этой схеме найдем ток базы методом контурных токов:

$ cases(I_11 (R_b + R_"см") - I_22 R_"см" = E_in + E_"см",
  - I_11 R_"см" + I_22 R_"см" = -E_"см" -U_"бэ") $
$ R_11 = R_э + R_"см"\ E_11 = E_"см" + E_"см" $

$ E_22 = -E_"см" - U_"бэ" $
$ I_11 (R_б + R_"см") - I_б R_"см" = E_"вх" + E_"см" $
$ -I_11 R_"см" + I_б R_"см"= -E_"см" - U_"бэ" $
$ I_22 = I_б = (E_"вх" + E_"см")/R_б - ((R_б + R_"см") (E_"см" + U_"бэ"))/(R_"см" R_б) = 0.00019 А $

Находим $R_к$ и подставляем в схему:
$ R_к = E_к/(B  I_б) = 480 "Ом"$	

Схема с $R_к$ границы режима насыщения показана на рисунке 3:
#img(image("3.png", width:90%), [Схема 3])


Построим график DC анализа для схемы 3, показанный на рисунке 4:
#img(image("4.png", width:90%), [DC анализ])

Схема для расчёт статического коэффициента усиления по току базы B в активном режиме транзистора показана на рисунке 5:
#img(image("5.png", width:90%), [Схема 4])

$ (23.6*10^"-3")/(197.1*10^"-6") = 117 tilde.eq 120 $

Построим DC sweep для тока на базе и коллекторе, что видно на рисунке 6:
#img(image("6.png", width:90%), [DC анализ])

$ (14.1*10^"-3")/(118.2*10^"-6") = 118 tilde.eq 120 $

Схема для исследования статического коэффициента усиления по току В при различных $R_к$ показана на рисунке 7:
#img(image("7.png", width:90%), [Схема 5])


Показатели, полученные при изменении $R_1$ на схеме 5:
#set text(12pt)
#align(center)[
  #tablex(
    columns: 8,
    inset: 4pt,
    align: center+horizon,
    [$R_1$, Ом], [10], [100], [300], [600], [900], [1500], [5000],
    [$I_б$, А], [0,000197], [0,000197], [0,000197], [0,000197], [0,000198], [0,000198], [0,0002],
    [$I_к$, A], [0,0236], [0,0236], [0,0236], [0,018], [0,012], [0,0072], [0,0021],
    [$U$, В], [10,7], [8,6], [3,9], [0,155], [0,126], [0,105], [0,07],
    [b], [119,79695], [119,79695], [119,79695], [91,370558], [60,606061], [36,363636], [10,5]
  )
]
#set text(14pt)

= Часть 2

Схема для исследования динамических характеристик при различном уровне входного сигнала показана на рисунке 8:
#img(image("8.png", width:90%), [Схема 6])
 
Графики Transient analyses для 5 В показаны на рисунках 9-11:
#img(image("9.png", width:90%), [Transient analyses для схемы 6])
#img(image("10.png", width:90%), [Начало фронта])
#img(image("11.png", width:90%), [Конец фронта])

#align(center)[
  #tablex(
    columns: 4,
    inset: 7pt,
    align: center+horizon,
    [$E_r$, B], [$τ_ф$, мкс], [$τ_"рас"$, мкс], [$τ_с$, мкс],
    [5],	[4,8],	[0,12],	[2,42],
    [7,5],	[2,47],	[0,33],	[3,4],
    [11],	[1,81],	[4,8],	[3,8],
    [12,5],	[1,6],	[5,5],	[5,1]
  )
]

Время формирования фронта для 11 В: $τ_ф = τ_в ln (S - 0.1)/(S - 0.9) = 1,9*10^"-6"$ – погрешность 5%, где
$
τ_в = 12 π f_в = 9,6*10^"-6" с\
f_в = (f_alpha)/(B+1) = 16528 "Гц"\
J_"б1" = (E_"вх" + Е_"см")/R_б - ((R_б + R_"см")(Е_"см"+U_"бэ"))/(R_"см" R_"б") = 1,9*10^"-4" А\
J_"б2" = U_"бэ"/R_"см" + Е_"см"/R_"см" = 6,6*10^"-5" А\
J_"бн" = Е_к/(B R_к) = 4,1*10^"-5" А\
S = J_"б1"/J_"бн"  = 4,562
$

Время рассеивания для 9 В: $ τ_"рас" = τ_н ln (S J_"бн" + J_"б2")/(J_"бн" + J_"б2") = 5*10^"-6" arrow "погрешность" 4% $
Время среза для 9 В: $ τ_с = τ_в ln (J_"б1"/S  + J_"б2")/J_"б2" = 4,7*10^"-6" arrow "погрешность 19%" $

= Часть 3

Исследование влияния форсирующего конденсатора показана на рисунке 12:
#img(image("12.png", width:90%), [Исследование влияния форсирующего конденсатора ])

График влияния форсирующего конденсатора с величиной 0,75пФ, показан на рисунке 13:
#img(image("13.png", width:90%), [График влияния форсирующего конденсатора с величиной 0,75пФ])

График влияния форсирующего конденсатора с величиной 20пФ, показан на рисунке 14:
#img(image("14.png", width:90%), [График влияния форсирующего конденсатора с величиной 20пФ])

График влияния форсирующего конденсатора с величиной 40пФ, показан на рисунке 15:
#img(image("15.png", width:90%), [График влияния форсирующего конденсатора с величиной 40пФ])

По графикам видно, что ток базы увеличивается и перезарядка емкостей проходит быстрее.

Исследование влияния конденсатора нагрузки показана на рисунке 16:
#img(image("16.png", width:90%), [Схема 8])


График влияния конденсатора нагрузки с величиной 0,5пФ, показан на рисунке 17:
#img(image("17.png", width:90%), [График влияния конденсатора нагрузки с величиной 0,5пФ])

График влияния конденсатора нагрузки с величиной 2пФ, показан на рисунке 18:
#img(image("18.png", width:90%), [График влияния конденсатора нагрузки с величиной 2пФ])

График влияния конденсатора нагрузки с величиной 10пФ, показан на рисунке 19:
#img(image("19.png", width:90%), [График влияния конденсатора нагрузки с величиной 10пФ])

По графикам видно, что ёмкостная нагрузка не влияет на время рассеивания и делает значение остальных параметров при увеличении ёмкости в цепи нагрузки.
Работа ключа с инверсным запиранием показана на рисунке 20:
#img(image("20.png", width:90%), [Работа ключа с инверсным запиранием])


График работы ключа с инверсным запиранием при $R_б = 1 "kОм", R_"см" = 250 "Ом" и R_к = 3 "kОм"$, показан на рисунке 21:
#img(image("21.png", width:90%), [График работы ключа с инверсным запиранием])

По графику видно, что рассеивание заряда сначала проходит у эмиттерного перехода. А также, что ток коллектора увеличивается, эмиттера уменьшается, а базы не меняется.

= Вывод 
В ходе выполнения работы были исследованы статические режимы и переходные процессы в схеме простого транзисторного ключа.



