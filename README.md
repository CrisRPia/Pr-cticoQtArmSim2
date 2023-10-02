# Práctico 2 QtArmSim

``` assembly
        .data       @ Comienzo de la zona de datos
word1:  .word 15    @ Número en decimal
word2:  .word 0x15  @ Número en hexadecimal
word3:  .word 015   @ Número en octal
word4:  .word 0b11  @ Número en binario

        .text
stop:   wfi
```

------------------------------------------------------------------------

*Copia el fichero anterior en QtArmSim, ensámblalo y resuelve los
siguientes ejercicios.*

### 1.12

> Encuentra los datos almacenados en memoria: localiza dichos datos en
> el panel de memoria e indica su valor en hexadecimal.

R:

| Etiqueta | Posición\* |    Valor    |
|:--------:|:----------:|:-----------:|
|   word1  |    0..3    | 0F 00 00 00 |
|   word2  |    4..7    | 15 00 00 00 |
|   word3  |    8..B    | 0F 00 00 00 |
|   word4  |    C..F    | 0F 00 00 00 |

*\* Las posiciones de la tabla representan el último dígito de la
dirección, reemplazando el último dígito de: `0x2007000`.*

### 1.13

> ¿En qué direcciónes se han almacenado las cuatro palabras? ¿Por qué
> las direcciónes de memoria en lugar de ir de uno en uno van de cuatro
> en cuatro?

R:

| Variable | Posición\* |
|:--------:|:----------:|
|   word1  |    0..3    |
|   word2  |    4..7    |
|   word3  |    8..B    |
|   word4  |    C..F    |

Se almacenan de a cuatro bits porque el programa compila con un objetivo
de 32 bits, particularmente arquitectura ARM. Por lo tanto, una word
ocupará 32 bits, lo que es lo mismo que 4 bytes.

### 1.14

> Recuerda que las etiquetas sirven para referenciar la posición de
> memoria de la línea en la que están. Así pues, ¿qué valores toman las
> etiquetas `word1`, `word2`, `word3`, `word4`?

R:

| Etiqueta |    Valor    |
|:--------:|:-----------:|
|   word1  | 0F 00 00 00 |
|   word2  | 15 00 00 00 |
|   word3  | 0F 00 00 00 |
|   word4  | 0F 00 00 00 |

### 1.15

------------------------------------------------------------------------

Crea ahora otro programa con el siguiente código:

``` assembly
        .data
words:  .word 15, 0x15, 015, 0b11

        .text
stop:   wfi
```

------------------------------------------------------------------------

> Cambia al modo de simulación. ¿Hay algún cambio en los valores
> almacenados en memoria con respecto a los almacenados por el programa
> anterior? ¿Están en el mismo sitio?

R: No hay cambio alguno.

### 1.16

> Teniendo en cuenta el ejercicio anterior, crea un programa en
> ensamblador que defina un vector de cinco palabras (words), asociado a
> la etiqueta vector, que tenga los siguientes valores: 0x10, 30, 0x34,
> 0x20 y 60. Camia al modo simulador y comprueba que el vector se ha
> almacenado de forma correcta.

R:

``` assembly
        .data
words:  .word 0x010, 30, 0x34, 0x20, 60

        .text
stop:   wfi
```

------------------------------------------------------------------------

*Teclea el siguiente programa en el editor de QtArmSim y ensámblalo.*

``` assembly
        .data   @ Comienzo de la zona de datos
bytes:  .byte 0x10, 0x20, 0x30, 0x40
word:   .word 0x10203040

        .text
stop:   wfi
```

------------------------------------------------------------------------

### 1.17

> ¿Qué valores se han guardado en la memoria?

R:

##### Bytes:

| Posición\* | Valor |
|:----------:|:-----:|
|      0     |   10  |
|      1     |   20  |
|      2     |   30  |
|      3     |   40  |

##### Word:

| Posición\* |    Valor    |
|:----------:|:-----------:|
|    4..7    | 40 30 20 10 |

*\* Las posiciones de la tabla representan el último dígito de la
dirección, siendo el resto `0x2007000`.*

### 1.18

> Viendo cómo se han almacenado y cómo se muestran en el simulador la
> secuencia de bytes y la palabra, ¿qué tipo de organización de datos,
> *big-endian* o *little-endian*, crees que sigue el simulador?

R: Sigue *big-endian*, de lo contrario la word se guardaría como
`10 20 30 40` en lugar de `40 30 20 10`.

### 1.19

> ¿Qué valores toman las etiquetas `bytes` y `word`?

R:

##### Bytes:

| Posición\* | Valor |
|:----------:|:-----:|
|      0     |   10  |
|      1     |   20  |
|      2     |   30  |
|      3     |   40  |

##### Word:

| Posición\* |    Valor    |
|:----------:|:-----------:|
|    4..7    | 40 30 20 10 |

*\* Las posiciones de la tabla representan el último dígito de la
dirección, siendo el resto `0x2007000`.*

------------------------------------------------------------------------

*Copia el siguiente código en el simulador y ensámblalo.*

            .data
    str:    .ascii "abcde"
    byte:   .byte 0xff

            .text
    stop:   wfi

------------------------------------------------------------------------

### 1.20

> ¿Qué rango de posiciones de memoria se han reservado para la variable
> etiquetada con `str`?

R:

##### str:

| Posición\* | Valor |
|:----------:|:-----:|
|      0     |   61  |
|      1     |   62  |
|      2     |   63  |
|      3     |   64  |
|      4     |   65  |

*\* Las posiciones de la tabla representan el último dígito de la
dirección, siendo el resto `0x2007000`.*

### 1.21

> ¿Cuál es el código UTF-8 de la letra `a`? ¿Y el de la `b`?

R:

| Letra | Valor\* |
|:-----:|:-------:|
|   a   |    61   |
|   b   |    62   |

*\* El valor es representado en hexadecimal tanto en esta tabla como el
resto.*

### 1.22

> ¿Qué posición de memoria referenfia la etiqueta `byte`?

R:

##### byte:

| Posición\* | Valor |
|:----------:|:-----:|
|      7     |   FF  |

*\* Las posiciones de la tabla representan el último dígito de la
dirección, siendo el resto `0x2007000`.*

### 1.23

> ¿Cuántos bytes se han reservado en total para la cadena?

R: Se han reservado cinco bytes para la cadena, uno por carácter.

### 1.24

> La directiva `.asciz "cadena"` también sirve para declarar cadenas.
> Pero hace algo más que tienes que averiguar en este ejercicio.
> Sustituye en el programa anterior la directiva `.ascii` por la
> directiva `.asciz` y ensambla de nuevo el código. ¿Hay alguna
> diferencia en el contenido de la memoria utilizada? ¿Cuál? Describe
> cuál es la función de esta directiva y cuál crees que puede ser su
> utilidad con respecto a `.ascii`.

R:

##### str:

| Posición\* | Valor |
|:----------:|:-----:|
|      0     |   61  |
|      1     |   62  |
|      2     |   63  |
|      3     |   64  |
|      4     |   65  |
|      5     |  `00` |

La directiva le añade `00` (el NUL de C) al final de la cadena. Esto se
hace para poder diferenciar cuándo es que termina una cadena, pues NUL,
en el contexto de una cadena, no representa nada más. Si no fuese por
NUL, el resto de la memoria sería indistinguible del contenido de una
cadena.

*\* Las posiciones de la tabla representan el último dígito de la
dirección, siendo el resto `0x2007000`.*

------------------------------------------------------------------------

*Dado el siguiente código:*

``` assembly
        .data @ Comienzo de la zona de datos
byte1:  .byte 0x11
space:  .space 4
byte2:  .byte 0x22
word:   .word 0xAABBCCDD

        .text
stop:   wfi
```

### 1.25

> ¿Qué posiciones de memoria se han reservado para almacenar la variable
> `space`?

R:

##### space:

| Posición\* |    Valor    |
|:----------:|:-----------:|
|    1..4    | 00 00 00 00 |

*\* Las posiciones de la tabla representan el último dígito de la
dirección, siendo el resto `0x2007000`.*

### 1.26

> ¿Los cuatro bytes utilizados por la variable `space` podrían ser
> leídos o escritos como si fueran una palabra? ¿Por qué?

R: Si la pregunta refiere a una palabra como un .word, sí, pues el
espacio reservado es el adecuado y cualquier valor es aceptable para una
palabra. Si se refiere a una cadena de UTF-8, no, pues todos sus
cáracteres serían NUL.

### 1.27

> ¿A partir de qué dirección se ha inicializado `byte1`? ¿A partir de
> cuál `byte2`?

##### byte1:

| Posición\* | Valor |
|:----------:|:-----:|
|      0     |   11  |

##### byte2:

| Posición\* | Valor |
|:----------:|:-----:|
|      5     |   22  |

*\* Las posiciones de la tabla representan el último dígito de la
dirección, siendo el resto `0x2007000`.*

### 1.28

> ¿A partir de qué dirección se ha inicializado `word`? ¿La palabra
> `word` podría ser leída o escrita como si fuera una palabra? ¿Por qué?

R:

##### word:

| Posición\* |    Valor    |
|:----------:|:-----------:|
|    6..9    | DD CC BB AA |

Si la pregunta refiere a una palabra como un .word, sí, pues el espacio
reservado es el adecuado y cualquier valor es aceptable para una
palabra. Si se refiere a una cadena de UTF-8, también, pues todos sus
valores son aceptables como caracteres.

------------------------------------------------------------------------

### 1.29

Añade en el código anterior dos directivas `.balign N` de tal forma que:

-   la variable etiquetada con `space` comience en una posición de
    memoria múltiplo de 2, y

-   la variable etiquetada con `word` esté en un múltiplo de 4

R:

``` assembly
        .data @ Comienzo de la zona de datos
byte1:  .byte 0x11
        .balign 2
space:  .space 4
byte2:  .byte 0x22
        .balign 4
word:   .word 0xAABBCCDD

.text
stop: wfi
```

------------------------------------------------------------------------

            .text
    main:   mov r0, #0x12
            wfi

------------------------------------------------------------------------

*Copia el código anterior y ensámblalo. A continuación, realiza los
siguientes ejercicios.*

### 1.30

> Modifica a mano el contenido del registro r0 para que tenga el valor
> 0x12345678 (haz doble clic sobre el contenido del registro)

R: Ok.

### 1.31

> Después de modificar a mano el registro r0, ejecuta el programa. ¿Qué
> valor tiene ahora el registro r0? ¿Se ha modificado todo el contenido
> del registro o solo el byte de menor peso del contenido del registro?

R: `0x00000012`. Se ha modificado todo el contenido del registro.

------------------------------------------------------------------------

``` assembly
        .text
main:   ldr r1, =0xFF
ldr     r2, =0x10203040
        wfi
```

------------------------------------------------------------------------

*Copia el código anterior y ensámblalo, y contesta las siguientes
preguntas.*

### 1.32

> La preuso-instrucción `ldr r1 , 0xFF`, ¿a qué instrucción ha dado
> lugar al ser ensamblada?

R: `movs r1, #255`.

### 1.33

> La preuso-instrucción `ldr r2 , 0x10203040`, ¿a qué instrucción ha
> dado lugar al ser ensamblada?

R: `ldr r2, [pc, #4]`.

### 1.34

> Localiza el número 0x10203040 en la memoria ROM, ¿dónde está?

R: `0x00180008`..`0x0018000B` en orden inverso por byte.

### 1.35

> Ejecuta el programa paso a paso anota qué valores se almacenan en el
> registro r1 y en el registro r2.

|  Paso|      r1     |      r2     |
|-----:|:-----------:|:-----------:|
|     0| 00 00 00 00 | 00 00 00 00 |
|     1| 00 00 00 FF | 00 00 00 00 |
|     2| 00 00 00 FF | 10 20 30 40 |

------------------------------------------------------------------------

``` assembly
        .data
word1:  .word 0x10203040
word2:  .word 0x11213141
word3:  .word 0x12223242

        .text
main:   ldr r0, =word1
        ldr r1, =word2
        ldr r2, =word3
        wfi
```

------------------------------------------------------------------------

*Copia y ensambla el programa anterior. Luego contesta las siguientes
preguntas.*

### 1.36

> ¿En qué direcciones de memoria se encuentran las variables etiquetadas
> con `word1`, `word2` y `word3`?

R:

| Etiqueta | Posición\* |
|:--------:|:----------:|
|   word1  |    0..3    |
|   word2  |    4..7    |
|   word3  |    8..B    |

*\* Las posiciones de la tabla representan el último dígito de la
dirección, siendo el resto `0x2007000`.*

### 1.37

> ¿Puedes localizar los números que has contestado en la pregunta
> anterior en la memoria ROM? ¿Dónde?

R:

| Etiqueta |        Posición       |
|:--------:|:---------------------:|
|   word1  | 0x00180008..0x001800B |
|   word2  | 0x0018000C..0x001800F |
|   word3  | 0x00180010..0x0018013 |

### 1.38

> El contenido de la memoria ROM también se muestra en la ventana de
> desensamblado del simulador, ¿puedes localizar ahí también dichos
> números? ¿dónde están?

R: Se encuentran en las "instrucciones" consecuentes al programa. \#\#\#
1.39

> Escribe a continuación en qué se han convertido las tres instrucciones
> ldr.

R:

``` assembly
ldr     r0, [pc, #4]
ldr     r1, [pc, #8]
ldr     r2, [pc, #8]
```

### 1.40

> ¿Qué crees que hacen las instrucciones?

R: Leen el valor guardado en una posición en memoria relativa al
contador de programa actual en ROM y lo guardan en el registro indicado.
\#\#\# 1.41

> Ejecuta el programa, ¿qué se ha almacenado en los registros r0, r1 y
> r2?

| Registro |    Valor   |
|:--------:|:----------:|
|    r0    | 0x20070000 |
|    r0    | 0x20070004 |
|    r0    | 0x20070008 |

Se han guardado la posición en RAM de las variables.

### 1.42

> Anteriormente se ha comentado que las etiquetas se utilizan para hacer
> referencia a la dirección de memoria en la que se han definido.
> Sabiendo que en los registros r0, r1 y r2 se ha almacenado el valor de
> las etiquetas `word1`, `word2` y `word3`, respectivamente, ¿se
> confirma o desmiente dicha afirmación?

R: Se confirma.

### 1.43

> Repite diez veces: «Una etiqueta hace referencia a una dirección de
> memoria, no al contenido de dicha dirección de memoria.»

``` python
print(
    "\n".join(["Una etiqueta hace referencia a una dirección de memoria, no al "
               + "contenido de dicha dirección de memoria." for _ in range(10)])
)
```

------------------------------------------------------------------------

``` assembly
        .data
word1:  .word 0x10203040
word2:  .word 0x11213141
word3:  .word 0x12223242

        .text
main:   ldr r0, =word1      @ r0 <- 0x20070000
        mov r1, #8          @ r1 <- 8
        ldr r2, [r0]
        ldr r3, [r0, #4]
        ldr r4, [r0, r1]
        wfi
```

------------------------------------------------------------------------

### 1.44

> La instrucción `ldr r2, [r0]`
>
> -   ¿En qué instrucción máquina se ha convertido?

R: `ldr r2, [r0, #0]`

> -   ¿De qué dirección de memoria va a cargar la palabra?

R: `0x20070000`

> -   ¿Qué valor se va a cargar en el registro 2?

R: `0x10203040`

### 1.45

> Ejecuta el código paso a paso hasta la instrucción `ldr r2, [r0]`
> inclusive y comprueba si es correcto lo que has contestado en el
> ejercicio anterior.

R: Más bien que si.

### 1.46

> La instrucción `ldr r3, [r0, #4]`:
>
> -   ¿De qué dirección de memoria va a cargar la palabra?

R: `0x20070004`

> -   ¿Qué valor se va a cargar en el registro 2?

R: `0x11213141`

### 1.47

> Ejecuta el código paso a paso hasta la instrucción `ldr r3, [r0, #4]`
> inclusive y comprueba si es correcto lo que has contestado en el
> ejercicio anterior.

R: Más bien que si.

### 1.48

> La instrucción `ldr r4, [r0, r1]`:
>
> -   ¿De qué dirección de memoria va a cargar la palabra?

R: `0x20070008`

> -   ¿Qué valor se va a cargar en el registro 2?

R: `0x12223242`

### 1.49

> Ejecuta el código paso a paso hasta la instrucción `ldr r4, [r1]`
> inclusive y comprueba si es correcto lo que has contestado en el
> ejercicio anterior.

R: Más bien que si.

*Copia y ensambla el programa anterior. Luego contesta las siguientes
preguntas.*

### 1.50

> La instrucción `str r2, [r0]`:
>
> -   ¿En qué instrucción máquina se ha convertido?

R: `str r2, [r0, #0]`

> -   ¿En qué dirección de memoria va a almacenar la palabra?

R: `0x20070000`

> -   ¿Qué valor se va a almacenar en dicha dirección de memoria?

R: 16 decimal (0x10).

### 1.51

> Ejecuta el código paso a paso hasta la instrucción
> `str r2, [r0]ldr r3, [r0, #4]` inclusive y comprueba si es correcto lo
> que has contestado en el ejercicio anterior.

R: Más bien que si.

### 1.52

> La instrucción `str r2, [r0, #4]`:
>
> -   ¿En qué dirección de memoria va a almacenar la palabra?

R: `0x20070004`

> -   ¿Qué valor va a almacenar en dicha dirección de memoria?

R: 16 decimal (0x10).

### 1.53

> -   Ejecuta un paso más del programa y comprueba si es correcto lo que
>     has

    > contestado en el ejercicio anterior.

R: Más bien que si.

### 1.54

> La instrucción `str r2, [r0, r1]`:
>
> -   ¿En qué dirección de memoria va a almacenar la palabra?

R: `0x20070008`

> -   ¿Qué valor va a almacenar en dicha dirección de memoria?

R: 16 decimal (0x10).

### 1.55

> -   Ejecuta un paso más del programa y comprueba si es correcto lo que
>     has

    > contestado en el ejercicio anterior.

R: Más bien que si.

------------------------------------------------------------------------

### 1.56

> Desarrolla un programa en ensamblador que reserve espacio para dos
> vectores consecutivos, A y B, de 20 palabras.

``` assembly
        .data
vec1:   .space 100
vec2:   .space 100

        .text

stop:   wfi
```

### 1.57

> Desarrolla un programa ensamblador que realice la siguiente reserva de
> espacio en memoria: una palabra, un byte y otra palabra alineada en
> una dirección múltiplo de 4.

``` assembly
        .data
word1:  .word 0
        .balign
byte1:  .byte 0
word2:  .word 0

        .text

stop:   wfi
```

### 1.58

> Desarrolla un programa ensamblador que realice la siguiente reserva de
> espacio e inicialización de memoria: una palabra con el valor 3, un
> byte con el valor 0x10, una reserva de 4 bytes que comience en una
> dirección múltiplo de 4, y un byte con el valor 20.

``` assembly
        .data
word1:  .word 3
byte1:  .byte 0x10
        .balign 4
bytes:  .space 4
byte2:  .byte 20

        .text

stop:   wfi
```

### 1.59

> Desarrolla un programa ensamblador que inicialice, en el espacio de
> datos, la cadena de caracteres «Esto es un problema», utilizando:
>
> 1.  La directiva `.ascii`

> 2.  La directiva `.byte`

``` assembly
        .data
bytes:  .byte 0x45, 0x73, 0x74, 0x6f, 0x20, 0x65, 0x73, 0x20, 0x75, 0x6e, 0x20, 0x70, 0x72, 0x6f, 0x62, 0x6c, 0x65, 0x6d, 0x61

        .text

stop:   wfi
```

> 3.  La directiva .word

``` assembly
        .data
words:  .word 0x6f747345, 0x20736520, 0x70206e75, 0x6c626f72, 0x616d65

        .text

stop:   wfi
```

### 1.60

> Sabiendo que un entero ocupa una palabra, desarrolla un programa
> ensamblador que inicialice en la memoria la matriz A de enteros
> definida como:
>
> $$
> \left(
> \begin{array}{lcr}
>     1 & 2 & 3 \\
>     4 & 5 & 6 \\
>     5 & 6 & 7
> \end{array}
> \right)
> $$
>
> suponiendo que:
>
> 1.  La matriz A se almacena por filas (los elementos de una misma fila
>     se almacenan de forma contigua en memoria).

``` assembly
        .data
matriz: .word 1, 2, 3, 4, 5, 6, 7, 8, 9

        .text

stop:   wfi
```

> 2.  La matriz A se almacena por columnas (los elementos de una misma
>     columna se almacenan de forma contigua en memoria).

``` assembly
        .data
matriz: .word 1, 4, 7, 2, 5, 8, 3, 6, 9

        .text

stop:   wfi
```

### 1.61

> Desarrolla un programa ensamblador que inicialice un vector de
> enteros, V , definido como V = (10, 20, 25, 500, 3) y cargue los
> elementos del vector en los registros r0 al r4.

``` assembly
        .data
V:      .word 10, 20, 25, 500, 3

        .text
main:   ldr r0, =V
        ldr r1, [r0, #4]
        ldr r2, [r0, #8]
        ldr r3, [r0, #12]
        ldr r4, [r0, #16]
        ldr r0, [r0, #0]

stop:   wfi
```

### 1.62

> Amplía el anterior programa para que además copie a memoria el vector
> V justo a continuación de éste.

``` assembly
.data
V:  .word 10, 20, 25, 500, 3

        .text
main:   ldr r5, =V
        ldr r0, [r5, #0]
        ldr r1, [r5, #4]
        ldr r2, [r5, #8]
        ldr r3, [r5, #12]
        ldr r4, [r5, #16]

        str r0, [r5, #20]
        str r1, [r5, #24]
        str r2, [r5, #28]
        str r3, [r5, #32]
        str r4, [r5, #36]

stop:   wfi
```

### 1.63

> Desarrolla un programa ensamblador que dada la siguiente palabra,
> 0x1020 3040, almacenada en una determinada posición de memoria, la
> reorganice en otra posición de memoria invirtiendo el orden de sus
> bytes.

``` assembly
        .data
word:   .word 0x10203040
out:    .word 0

        .text
main:   ldr r0, =word
        ldr r2, =out

        ldrb r1, [r0, #0]
        strb r1, [r2, #3]

        ldrb r1, [r0, #1]
        strb r1, [r2, #2]

        ldrb r1, [r0, #2]
        strb r1, [r2, #1]

        ldrb r1, [r0, #3]
        strb r1, [r2, #0]

stop:   wfi
```

### 1.64

> Desarrolla un programa ensamblador que dada la siguiente palabra,
> 0x1020 3040, almacenada en una determinada posición de memoria, la
> reorganice en la misma posición intercambiando el orden de sus medias
> palabras. (Nota: recuerda que las instrucciones `ldrh` y `strh` cargan
> y almacenan, respectivamente, medias palabras).

``` assembly
        .data
word:   .word 0x10203040

        .text
main:   ldr r0, =word

        ldrh r1, [r0, #0]
        ldrh r2, [r0, #2]

        strh r1, [r0, #2]
        strh r2, [r0, #0]

stop:   wfi
```

### 1.65

> Desarrolla un programa ensamblador que inicialice cuatro bytes con los
> valores 0x10, 0x20, 0x30, 0x40; reserve espacio para una palabra a
> continuación; y transfiera los cuatro bytes iniciales a la palabra
> reservada.

```assembly
        .data
bytes:  .byte 0x10, 0x20, 0x30, 0x40
word:   .word 0

        .text
main:   ldr r0, =word
        ldr r1, =bytes
        ldr r1, [r1]
        str r1, [r0]
stop:   wfi
```
