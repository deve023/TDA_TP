# TDA TP
Trabajo Práctico de la materia Técnica Digital Avanzada

En el presente trabajo se desarrollará un sistema digital anti robo que funciona con un sensor PIR de movimiento, un pulsador para activarse y una llave segura para desactivarse. Si el sistema está activo y se detecta movimiento por más de 30 segundos, se prende una alarma sonora. El sistema está dividido en dos grandes bloques; uno sincrónico y otro asincrónico. El bloque sincrónico actúa como contador, de 30 a 0 segundos, y el bloque asincrónico funciona como trigger para el contador, en función de sus entradas y estados. Ambos bloques son secuenciales.

# Diagrama en bloques

![diagrama_bloques_completo](https://github.com/deve023/TDA_TP/assets/51866497/20366951-8bf9-4a6e-a6c5-7fc5299d8c52)

# Entradas
* x(2): Pulsador para activar el sistema. HIGH botón pulsado. LOW botón suelto. Una vez pulsado, el sistema queda activo y de sensar movimiento por 30 segundos hará sonar la alarma. Pulsarlo nuevamente no tiene efecto.
* x(1): Llave switch para desactivar la alarma. Es un switch únicamente accionable con una llave física. HIGH llave accionada. LOW llave sin accionar. Si se acciona la llave el sistema se encuentra forzozamente desactivado, máxima prioridad.
* x(0): Sensor PIR. HIGH se detecta movimiento en el ambiente. LOW no se detecta movimiento.

# Salidas
* LED amarillo: Se enciende si se está detectando movimiento, independientemente del estado del sistema.
* LED rojo 1: Se enciende si el sistema se encuentra activo.
* LED rojo 2: Se enciende si el contador está funcionando y por sonar la alarma.
* Buzzer: Alarma sonora, suena cuando el sistema se encuentra activo y se ha detectado movimiento por más de 30 segundos.
\end{itemize}

El sistema actualmente se plantea con un único sensor PIR de movimiento pero el mismo es fácilmente escalable para manejar distintos sensores a través de distintos ambientes, manteniendo la misma funcionalidad.

A continuación se detalla las distintas etapas de diseño e implementación de los bloques asincrónico y sincrónico. El sistema completo es alimentado por una batería de 9 V y un regulador LM7805 que provee unos estables 5 V. Las compuertas utilizadas son todas de tecnología TTL.
