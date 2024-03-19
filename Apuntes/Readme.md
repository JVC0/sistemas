# RESU Admin Usuarios

# Usuarios

Crear nuevo usuario

```bash
sudo useradd nuevousuario

# esto crea un grupo llamado igual por defecto y un directorio /home/nuevousuario 
```

Añadir a un grupo

```bash
useradd nuevousuario -g grupoprincipal

# el grupo debe existir
# -g se usa para añadir al grupo principal
# -G agregar a grupo secundario(tantos como quiera)

#Ejemplo:
useradd nuevousuario -g grupoprincipal -G gruposecundario1,gruposecundario2
```

Especificar el directorio

```bash
useradd -d /home/otrodirectorio
```

Especificar nombre de usuario

```bash
useradd -c "Julia Schneider" julia
```

### Contraseñas

Tras crear usuario, se debe asignar contraseña.

```bash
sudo passwd julia

# pasa asignar una contraseña al usuario julia
```

```bash
# bloquear o desbloquear contraseña (poder o no cambiarla)
-l , --lock
-u , --unlock

# establecer máximo de contraseña (hasta que expire)
--maximum=DÍAS
passwd --maximum=90 julia

# así el usuario julia tendrá una contraseña que expire en 90 días
```

## otras operaciones

### usermod

cambiar nombre de inicio de sesión de usuario

```markdown
usermod -l nombreantiguo nombrenuevo
```

cambiar el directorio de un usuario

```markdown
usermod -d /nuevo/directorio -m nombreususario
# -m es de move, -d de directorio
```

agregar usuarios a grupos secundarios

```markdown
usermod -G grupo1,grupo2,grupo3
```

Ponerle fecha de expiración con formato AAAA-MM-DD

```markdown
usermod --expiredate 2024-05-02 nombredeusuario
```

bloquear contraseña de usuario

```markdown
usermod --lock nombreusuario
```

desbloquear contraseña de usuario

```markdown
usermod --unlock nombreusuario
```

BORRAR CUENTA (debes ser root)

```markdown
sudo userdel nombreusuario

# no borra los archivos
```

borrar cuenta y forzar borrar su directorio y archivos

```markdown

sudo userdel -rf nombreusuario
```

ver grupos que pertenecen a usuario

```markdown
groups nombreusuario
```

## Comando chage

cambia número de días en los que se tiene que cambiar la contraseña

```markdown
# muestra info respecto a contraseña de usuario

chage --list nombredeusuario

```

establecer máximo días contraseña

```markdown
chage -M 90 nombredeusuario
```

establecer contraseña como expirada (pedirá una nueva al usuario)

```markdown
chage -d 0 username
```

# Archivos Importantes

## etc/ passwd

base de datos de usuarios del sistema

cada línea es un usuario, y la info de este se separa mediante :

```markdown
Cuenta (nombre de usuario) : Contraseña : UID (ID de usuario) : GID (ID de grupo) : GECOS (campo opcional con propósitos informativos) : Directorio (directorio principal o home del usuario) : shell (ruta al shell predeterminado, campo opcional)
```

```markdown
julia:x:504:506:Julia Schneider:/home/julia:/bin/bash
```

Para ver el contenido del archivo:

```markdown
cat /etc/passwd
```

## etc/shadow

archivo que guarda las contraseñas de los usuarios en formato encriptado, además de info del usuario

```bash
julia:Z9B3Qve$f7tlKI8Shimc9ZDx.7KQGFBxFUrAX2xzMEOJVJ7YcEhePU5cR8Lo09V25aFbWe51eu3047K7kTlQJ3LG1K15y1:17043:0:90:7:::
```

# Administración de grupos

Conjunto de cuentas de usuarios que comparten permisos. A todos los usuarios se les asigna un identificador de usuario (uid) y de grupo (gid).

Ver los grupos disponibles con archivo:

### /etc/group

En cuanto a Usuarios:

El 0 es el root

luego reservados para el sistema hasta el 500

hasta el 999 para demonios o aplicaciones para el sistema

del 1000 hacia arriba son usuarios normales

## Crear un nuevo grupo

```bash
groupadd nombregrupo

groupadd -r nombregrupo
-- si queremos que sea un grupo que use el sistema
```

Modificar ajustes del grupo (groupmod)

Cambiar nombre del grupo:

```bash
groupmod -n gruponuevo grupoantiguo
```

agregar usuario a grupo con gpasswd

```bash
gpasswd -a nombredeusuario nombredegrupo
--a de add
```

eliminar usuario de grupo

```bash
gpasswd -d nombredeusuario nombredegrupo
-d de delete
```

Borrar grupo

```bash
groupdel nombredelgrupo
```

### Getent

es un comando para consultar las bases de datos del sistema de nombres, como **`/etc/passwd`**, **`/etc/group`**, **`/etc/hosts`**

Para cambiar de usuario:

```bash
su pepito
```

```bash
sudo useradd -d /home/kaiman -k /etc/skel/ -g pruebas -G lpadmin -m -s /bin/bash kaiman
```

Este comando crea un nuevo usuario llamado "kaiman" con un directorio de inicio en **`/home/kaiman`**, usando la configuración de **`/etc/skel/`** como base, asignándolo al grupo primario "pruebas" y al grupo secundario "lpadmin", asignándole **`/bin/bash`** como su shell predeterminado.

Para cambiar de usuario:

```bash
su nombreusuario
```

Para añadir darle a usuario permiso de administrador:

```bash
sudo usermod -G sudo nombreusuario
```

**Dónde está la info de cada resumen:**

Usuario: /etc/passwd

Contraseña de bloqueo: /etc/shadow

Grupo: /etc/group

contraseña grupo: /etc/gshadow

# WINDOWS

`

**net user:** Muestra la lista de usuarios en el sistema.

**net user ssf:** Muestra información detallada del usuario "ssf", incluyendo su nombre completo, si tiene una contraseña asignada, y su configuración de cuenta.

**net user prb1 /add:** Agrega un nuevo usuario llamado "prb1" al sistema. Por defecto, este usuario tendrá una configuración mínima.

**net localgroup:** Permite visualizar los grupos locales disponibles en el sistema.

Crear grupo:
**net localgroup Impresora /add:** Crea un nuevo grupo local llamado "Impresora".

Añadir a un grupo:
**net localgroup Impresora /add prb1:** Agrega al usuario "prb1" al grupo "Impresora".

Borrar de un grupo:
**net localgroup Impresora /del prb1:** Elimina al usuario "prb1" del grupo "Impresora".

**net user prb2 */add:** Crea un nuevo usuario llamado "prb2" y solicita una contraseña al momento de crearlo.

**net user prb2 */add /active:no /expires:10/10/2024 /times:L-V,14:00-21:00 /fullname:"Jesusito" /passwordreq:yes:**

- Crea un nuevo usuario llamado "prb2".
- Desactiva la cuenta hasta que se active manualmente.
- Establece la fecha de vencimiento de la cuenta para el 10 de octubre de 2024.
- Define un horario de inicio de sesión válido solo de lunes a viernes, de 14:00 a 21:00.
- Establece el nombre completo del usuario como "Jesusito".
- Requiere que se establezca una contraseña para el usuario.

**Añadir a administrador (y quitar de usuarios):**
net localgroup Administradores /add prb2: Agrega al usuario "prb2" al grupo de administradores y lo elimina del grupo de usuarios estándar.

**Activar cuenta:**
net user prb2 /active:yes: Activa la cuenta del usuario "prb2".

**Cambiar las horas de inicio de sesión:**
net user prb2 /times: Permite modificar el horario de inicio de sesión del usuario "prb2".

**net accounts:** Muestra información global de la configuración de cuentas del sistema, incluyendo la longitud mínima de la contraseña, la duración de la contraseña y otras políticas de seguridad.

**Configuración de la contraseña:**

net accounts /minpwlen:12 /minpwage:7 /maxpwage:30 /uniquepw:3: 

Establece las siguientes políticas de contraseña:

- Longitud mínima de la contraseña: 12 caracteres.
- Edad mínima de la contraseña: 7 días.
- Edad máxima de la contraseña: 30 días.
- Número de contraseñas únicas requeridas: 3.


# ADMINISTRACIÓN DE USUARIOS Y GRUPOS

## GNU/Linux 
Resuelve los siguientes apartados en la máquina virtual de GNU/Linux. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione:

**1- Muestra todos los usuarios de tu máquina virtual.** ¿Dónde está esa información? ¿Qué datos guarda el sistema sobre sus usuarios y cómo se organizan?
Para mostrar todos los usuarios de la máquina ejecuto el comando:

<ins>cat /etc/passwd</ins>
<ins>tail /etc/passwd</ins>
En este archivo se encuentra toda la información de los usuarios.  Cada línea es un usuario, y en esta línea se encuentra la siguiente información:
Cuenta (nombre de usuario) : Contraseña : UID (ID de usuario) : GID (ID de grupo) : GECOS (campo opcional con propósitos informativos) : Directorio (directorio principal o home del usuario) : shell (ruta al shell predeterminado, campo opcional)

**2- ¿Por qué hay tantos usuarios? De todos ellos, ¿cuáles realmente pueden abrir una consola de comandos? ¿cuáles podrían inciar una sesión con una contraseña válida? ¿Cómo sabes estos datos? ¿Por qué crees que es así?**

Hay usuarios en el sistema por defecto para diferentes propósitos y servicios. Aquellos usuarios que tienen una shell asignada (como /bin/bash) pueden abrir una consola de comandos. Los usuarios que tienen una contraseña válida podrían iniciar sesión con ella.
Puedes identificar qué usuarios pueden abrir una consola de comandos observando si tienen una shell asignada en el archivo /etc/passwd. Para saber cuáles pueden iniciar sesión con una contraseña válida, puedes verificar si tienen una contraseña configurada utilizando el comando passwd -S.


**3- Fíjate en el UID de los usuarios. ¿Ves alguna diferencia entre los usuarios con UID < 1000 y los que tiene un UID >= 1000? ¿Por qué es así?**

Sí, generalmente los usuarios con UID < 1000 son usuarios del sistema, mientras que los usuarios con UID >= 1000 son usuarios normales creados por el administrador. Esta convención se sigue para evitar conflictos con los UIDs reservados para usuarios del sistema. Para ser más concretos con los ID de los usuarios, el 0 es el root, hasta el 500 son reservados para el sistema, y desde ahí hasta el 999 son para demonios o servicios del sistema. Desde el 1000 en adelante son usuarios normales, creados por el administrador.


**4- Muestra todos los grupos de tu máquina virtual. ¿Dónde está esa información? ¿Qué datos guarda el sistema sobre sus grupos y cómo se organizan?**

La información de los grupos se encuentra en el archivo /etc/group. Cada línea en este archivo representa a un grupo y contiene información como el nombre del grupo, GID y los usuarios que pertenecen a ese grupo.

Se puede ver los grupos que hay con:

<ins>cat etc/group</ins>

**5. ¿Por qué hay tantos grupos? Intenta buscar información sobre qué funciones tienen los diferentes grupos de tu sistema, en los apuntes hay un enlace con algo de información.**

Existen tantos grupos porque cada uno cumple distintas funciones y se utilizan para dar a un usuario permisos de utilizar tales funciones.
Algunos de ellos son:
root: Este grupo otorga acceso pleno al sistema y normalmente solo el usuario root debería pertenecer a este grupo. Es fundamental para la administración del sistema y tiene privilegios elevados.


adm: Utilizado para el monitoreo de tareas del sistema, lo que permite a los usuarios pertenecientes a este grupo utilizar herramientas de monitoreo como xconsole y leer archivos de registro en /var/log sin necesidad de utilizar comandos su o sudo. Es esencial para los administradores del sistema.


backup: Este grupo permite a los usuarios realizar copias de seguridad y restauraciones sin necesidad de otorgarles permisos de root. Es importante para garantizar la integridad y disponibilidad de los datos mediante la realización de copias de seguridad regulares.


sudo: Los miembros de este grupo no necesitan escribir sus contraseñas al utilizar sudo. Proporciona a los usuarios privilegios elevados para ejecutar comandos administrativos sin necesidad de iniciar sesión como root.


shadow: Permite la lectura de /etc/shadow. Utilizado por algunos programas que necesitan acceder a este archivo.

**6. ¿Cómo comprobarías si un usuario existe ya en el sistema? ¿Y un grupo?**

para un usuario: <ins>id nombreusuario</ins>

para un grupo: <ins>getent group nombregrupo</ins>

**7. Crea el usuario "test01" de forma que su home sea /home/test01 (se deben copiar la configuración básica de /etc/skel) y su shell sea /bin/bash.**

sudo useradd -d /home/test01 -k /etc/skel/ -m -s /bin/bash test01

**8. Intenta abrir una sesión como "test01" una vez creado ¿puedes acceder? ¿Por qué? ¿Cómo lo arreglarías?**

No se puede porque no se le ha asignado una contraseña. Para ello se usa el comando:

<ins>sudo passwd test01</ins>



**9. El usuario "test01", ¿qué grupo principal tiene? Cámbialo para que sea su grupo principal sea "tests".
Su grupo principal tiene el mismo nombre que el del usuario, ya que se crea automáticamente así. Se puede comprobar con id test01. Para cambiarlo:**

<ins>sudo usermod -g tests test01</ins>


**10. Borra el grupo principal antiguo de test01, ¿puedes eliminarlo? ¿Por qué?**

<ins>sudo groupdel test01</ins>

Sí se puede, porque se permite eliminar si el grupo no está siendo utilizado por ningún usuario como grupo principal o secundario. 

**11. Borra el grupo "tests", ¿puedes eliminarlo? ¿Por qué?**

No, porque test01 está usando ese grupo.

**12. Asigna algunos grupos secundarios a "test01". Indica para qué sirve cada uno de los grupos creados.**

Para agregar a grupos secundarios se usa el comando usermod:

<ins>sudo usermod -G grupo1,grupo2 test01</ins>

Estos grupos son creados con:

<ins>sudo groupadd group1</ins>

En caso de querer añadir a alguno existente, se puede por ejemplo colocar en el grupo de video, disk o audio, que permite acceso a los dispositivos con estos nombres.
Otros:
https://blog.desdelinux.net/significado-de-los-grupos-y-usuarios-en-debian-gnulinux/

**13. Asigna algunos grupos más secundarios a "test01", SIN borrar los que ya tenía**

<ins>sudo usermod -aG nuevogrupo1 test01</ins>

Se usa la -a para no eliminar los que ya tenía.


**14. Elimina algunos grupos secundarios del usuario test01**

<ins>sudo gpasswd -d test01 grupoaeliminar</ins>


**15. Bloquea al usuario test01. Luego intenta abrir una sesión... ¿puedes? ¿Por qué?**

sudo passwd -l test01

Con este comando hace que se caduque la contraseña.

**16. Desbloquea al usuario test01. ¿Se ha perdido algo de su información?**

sudo passwd -u test01

No debería haber perdido información.?

**17. Cambia la información de test01 indicando su nombre completo, oficina, teléfono, etc.**

sudo chfn test01

Este comando te da opciones de escribir o modificar  todos esos datos.


**18. Cambia la shell de test01 a una que no permita ejecutar comandos.**

sudo chsh -s /bin/false test01


**19. Vuelve a dejarle a test01 su shell original**

sudo chsh -s /bin/bash test01


**20. Añade restricciones al usuario test01 de forma que tenga que cambiar la contraseña cada 15 días y que le avisen 3 días antes, dándole 2 días de margen para poder cambiar una contraseña caducada sin que se bloquee su cuenta. Además, la cuenta quedará deshabilitada el 30 de junio.**

sudo chage -M 15 -W 3 -I 2 -E 2023-06-30 test01

chage: Es el comando utilizado para modificar la configuración de la contraseña de un usuario.
-M 15: Establece el máximo número de días antes de que la contraseña del usuario expire. En este caso, se establece en 15 días, lo que significa que el usuario "test01" tendrá que cambiar su contraseña cada 15 días.
-W 3: Establece el número de días de advertencia antes de que la contraseña expire. En este caso, se establece en 3 días, lo que significa que el usuario "test01" recibirá una advertencia 3 días antes de que su contraseña expire.
-I 2: Establece el número de días de inactividad antes de que la cuenta del usuario se desactive automáticamente. En este caso, se establece en 2 días, lo que significa que si el usuario "test01" no inicia sesión durante 2 días, su cuenta se desactivará automáticamente.
-E 2023-06-30: Establece la fecha de caducidad para la cuenta del usuario. En este caso, se establece en el 30 de junio de 2023, lo que significa que la cuenta del usuario "test01" se desactivará automáticamente en esa fecha.


**21. Elimina el usuario test01 con todo el contenido en su espacio personal. Ten en cuenta que test01 podría seguir conectado.**

sudo userdel -rf test01

**22. ¿Qué pasaría si test01 siguiera conectado en el momento que se elimina su cuenta? ¿Podría seguir usando el equipo con normalidad? ¿Cómo harías para cerrar inmediatamente todos sus procesos que estuvieran aún en ejecución?**

sudo pkill -u test01 -9



# windows
**¿Por qué MS Windows distingue entre usuarios/grupos locales y globales?**

Windows distingue entre usuarios y grupos locales, que están limitados a un sistema específico, y usuarios y grupos globales, que pueden ser utilizados en una red de múltiples sistemas. Esto permite una gestión de acceso más granular y eficiente en entornos de red.

**Muestra todos los usuarios locales de tu máquina virtual. ¿Cuál es la función de cada usuario?
Para ver los usuarios locales se usa:**

net user
Está Administrador, kai, Utility, Invitado, .y cada usuario puede tener diferentes funciones dependiendo de cómo se configuren los permisos y las políticas de seguridad en el sistema.

**Muestra información detallada del usuario que estás usando ahora mismo. ¿Qué significa cada línea? ¿A qué grupos perteneces?**

net user kai97

**Muestra información sobre el usuario, como el país, nombre completo.. en caso de que el usuario lo haya rellenado. También informa sobre la contraseña y los cambios, el directorio principal, la última sesión, de qué grupos forma parte etc.
Muestra todos los grupos locales de tu máquina virtual. ¿Qué función tiene cada grupo (busca unos cuantos)?**

Los grupos en los que está mi usuario son Administradores y Usuarios.
El grupo Administradores  tiene privilegios de administración completos en el sistema, mientras que el de Usuarios tiene derechos y permisos básicos en el sistema. Por lo que mi usuario podrá realizar todas las tareas de administración y también tendrá acceso a las funciones estándar del sistema asignadas al grupo "Usuarios".

**Muestra información detallada del grupo "Usuarios". ¿Quién pertenece a este grupo? Repite la operación para el grupo de "Administradores".
Se puede acceder a la información de estos grupos con:**

net localgroup Usuarios
net localgroup Administradores

En el primero tiene el comentario: “Los usuarios no pueden hacer cambios accidentales o intencionados en el sistema y pueden ejecutar la mayoría de aplicaciones.” Pertenecen:
“kai97
NT AUTHORITY\INTERACTIVE
NT AUTHORITY\Usuarios autentificados”

En cuatro al de administradores, tiene como comentario “Los administradores tienen acceso completo y sin restricciones al equipo o dominio”
Y pertenecen:
Administrador
kai97


**Crea un usuario test01 SIN indicar contraseña.**

net user test01 /add /passwordreq:no

**Crea un usuario test02 indicando la contraseña en el propio comando**

net user test02 contraseña /add.

**Crea un usuario test03 y solicita que se indique la contraseña por teclado, sin mostrarla**

net user test03 * /add. 
Esto solicitará la contraseña sin mostrarla mientras se escribe.

Prueba a abrir sesión con los usuarios creados. ¿Puedes acceder con todos? Si no puedes acceder con alguno(s), indica cuál es el problema y soluciónalo.
¿A qué grupo(s) local(es) pertenecen los usuarios creados?
net user nombreusuario

Crea un grupo local llamado Informática. Añade los tres usuarios anteriores a ese grupo y muestra la lista de usuarios del grupo para ver que así es.

net localgroup Informática /add
net localgroup Informática test01 /add
net localgroup Informática test02 /add
net localgroup Informática test03 /add

Para verificar que los usuarios se han agregado correctamente al grupo "Informática":

net localgroup Informática

Haz que test03 sea administrador.
net localgroup Administradores test03 /add


Haz que la cuenta de test01 caduque al final de 2023 y que tenga que cambiar la contraseña la próxima vez que inicie sesión.

net user test01 /expires:12/31/2023
net user test01 /logonpasswordchg:yes


Desactiva al usuario test02.
net user test02 /active:no


Haz que el usuario test03 NO pueda cambiar su contraseña, y que esta NO sea obligatoria.

net user test03 /passwordchg:no


Prueba a iniciar de nuevo sesión con cada usuario... ¿qué sucede?
Con "test01", se pide que cambie la contraseña al iniciar sesión debido a la configuración de cambio de contraseña obligatorio.
Con "test02", la cuenta está desactivada y no se podrá iniciar sesión.
Con "test03", se puede iniciar sesión normalmente, pero no podrá cambiar la contraseña.

Indica el nombre completo del usuario test01 (invéntate uno) y añade comentarios a su cuenta.

net user test01 /fullname:"Kai Rodríguez" /comment:"Usuario de prueba para fines de desarrollo."


Elimina al usuario test03 del grupo local de "Informática".

net localgroup Informática test03 /del


Muestra la configuración global de las cuentas (longitud mínima de las contraseñas, duración, bloqueos, etc.).

Se muestra  la configuración global de las cuentas utilizando el comando:
net accounts

Modifica la configuración global para que todas las contraseñas tengan uan longitud mínima de 6 caracteres, se tengan que cambiar cada mes y no se puedan usar las últimas 3 contraseñas). 

net accounts /minpwlen:6 /maxpwage:30 /uniquepw:3


Elimina el grupo local de "Informática". Muestra todos los grupos locales para asegurate de que está eliminado.

	net localgroup Informática /delete

	Para asegurarse:
net localgroup
	
Elimina todos los usuarios creados en estos ejercicios. Muestra todos los usuarios locales para asegurarte de que han sido eliminados.
Para eliminar todos los usuarios creados se usa el comando:
 net user nombre_de_usuario /delete. 

Luego, se verifica que los usuarios hayan sido eliminados mostrando todos los usuarios locales con el comando:
net user

# Programación de Tareas

# Necesidad de programar tareas

Las tareas de administración, como copias de seguridad o migraciones, suelen **requerir tiempo y recursos**, y es preferible ejecutarlas durante periodos de baja actividad en el sistema, como altas horas de la madrugada. Para **evitar la necesidad de intervención manual** en estos momentos, se utilizan las tareas programadas. Estas **permiten preparar y ejecutar comandos automáticamente en el momento deseado, optimizando así la eficiencia y minimizando la interferencia con los usuarios y procesos del sistema.**

### Tipos de Tareas Programadas
- **Programación en Tiempo:**

    - Ejecución de acciones en un momento específico.
    - Permite planificar tareas para horas y fechas determinadas.
Ejemplo: copias de seguridad nocturnas.

- **Programación por Eventos:**

    - Acciones desencadenadas por sucesos en el sistema.
    - Reacciona a eventos específicos en lugar de a un horario predefinido.
Ejemplo: ejecutar un script al detectar un cambio en un archivo.

Estas tareas son llevadas a cabo por **servicios** que deben estar activos constantemente para monitorear el tiempo o los eventos que las disparan (trigger). Si el servicio no está activo en el momento programado, las tareas pueden retrasarse o incluso ser ignoradas, según la configuración.

Los servicios **no tienen interfaz ni comunicación directa con los usuarios.**
Reciben datos de las tareas a través de estrategias como programas clientes o escritura de datos en ficheros.

#### Ejecución en Terminal Virtual
- Los servicios ejecutan tareas en una especie de "terminal virtual".

- Los datos de salida (stdout) y errores (stderr) se pierden al finalizar la ejecución.

#### Directorio de Trabajo

- El directorio de trabajo puede ser diferente al esperado por el usuario.

- Es esencial especificar rutas absolutas para scripts, archivos de entrada/salida, etc.

#### Recomendaciones al Programar Tareas
- **Usar Rutas Absolutas:**
    - Especificar rutas completas para evitar problemas de ubicación de archivos.

- **Redireccionar Salida y Errores:**
    - Utilizar redirecciones para almacenar mensajes y datos de salida en archivos.
    - Redirigir stdin si es necesario para manejar entradas por teclado.

- **Evitar Dependencia de Configuraciones de Shell:**
    - No confiar en la carga de la configuración de la shell habitual.
    - No utilizar variables de entorno propias, alias u otras configuraciones que se ejecutan al iniciar la shell.


## GNU/LINUX

### Tareas por tiempo: Puntuales
- No suelen venir por defecto instaladas, pero la más importante es at ( apt install at).
- Indica fecha y hora a ejecutar. Permite varios formatos:
    - 12h con AM o PM
    - 24h
    - noon [12:00], midnight [0:00], teatime [16:00],
    -fechas formato americano MM/DD/[CC]YY, europeo DD.MM.[CC]YY o japonés[CC]YY-MM-DD.
    -también acepta: tomorrow, tuesday, next week, next month + 1 week, now + 10 minutes, now + 15min, now + 2 hours, next week - 2 days etc.
- Si es incorrecta la fecha, da error Garbled Time.
- Se abre un pequeño intérprete de comandos:
```bash
t 18:00 tomorrow
> who  >> ~/usuarios.txt 2>> ~/usuarios.err
> last >> ~/usuarios.txt 2>> ~/usuarios.err
Ctrl+D
```
Para programar la tarea en una línea se usa <<<. Por ejemplo:
```bash
at now + 10min <<< "uptime > ~/carga.txt 2> carga.err"
# para almacenar la carga del sistema dentro de 10 minutos
```
- Para ejecutar script en lugar de comando, se usa -f:
```bash
at next month + 1 day -f ~/scripts/copia_seguridad.sh >> ~/backup.txt 2>> ~/backup.err
```
- Si el demonio no está disponible al momento programado -> la tarea se ejecuta al encender el equipo o activar de nuevo el demonio atd.

### Algunas opciones útiles de at son:

- **Mostrar todas las tareas programadas:** atq     (o también: at -l)
- **Mostrar los detalles de la tarea con ID X:** at -c X (al principio se muestran todas las variables que se almacenan, y al final el comando a ejecutar)
- **Borrar una tarea con ID X:** atrm X          (o también: at -r X  o bien  at -d X)

### Tareas por tiempo: repetitivas

### Cron
- Es comúnmente instalado en distribuciones y utilizado para ejecutar tareas del sistema periódicamente.
- Existen diferentes versiones, como anacron, cronie, hcron, fcron, entre otras, con funcionalidades adicionales.

#### Programación de Tareas en cron
- Las tareas se programan en una tabla (crontab) con un formato específico.
- Se puede editar la tabla usando **crontab -e**.

#### La sintaxis de la tabla es: 

- m: Minutos (0-59)
- h: Hora (0-23)
- dom: Día del mes (1-31)
- mon: Mes (1-12)
- dow: Día de la semana (0-6, donde 0 es domingo)
- command: Comando o script a ejecutar

#### Símbolos y Formatos Especiales
- *: Cualquier valor.
- Rangos (-), Listas (,), Intervalos (/).
- También podemos realizar algunas combinaciones: 6-12/2 = 6,8,10,12

### Ejemplos
```bash
# Usar un script para borrar ficheros temporales todos los días a las 12:15
#m  h  dom mon dow  cmd
15  12  *   *   *   ~/borrar_temporales.sh >> ~/borrar_temporales.out 2>> ~/borrar_temporales.err

# Guardar la carga cada 20 minutos de 8:00 a 19:40 de lunes a viernes
# durante los días impares de la primera quincena de los meses de febrero, mayo, junio y septiembre
# m    h      dom     mon    dow  cmd
*/20  8-19  1-15/2  2,5,6,9  1-5  uptime >> ~/carga.txt

# Ejecutar un script cada minuto
#m  h  dom mon dow  cmd
 *  *   *   *   *   ~/mi_script.sh >> ~/mi_script.out 2>> ~/mi_script.err
```

- Algunas versiones recientes de cron soportan formatos no estándar y atajos como: **@hourly, @daily, @weekly, @monthly, @yearly, @reboot.**

- Otra forma de **indicar las tareas es escribiéndolas en un fichero y luego instalar el fichero en el cron** (se perderán todas las tareas previas). Por ejemplo, si hemos escrito todas nuestras tareas en el fichero mis_tareas.txt, para instalarlo sólo tenemos que hacer crontab mis_tareas.txt.

-Las tareas se instalan a nivel de usuario.Las tareas del sistema se almacenan en la tabla de tareas del usuario root.

#### Otras operaciones:
- **Listar todas las tareas:** crontab -l
- **Borrar todas las tareas:** crontab -r
- **Borrar algunas tareas:** editar la tabla de tareas con **crontab -e** y borrar las líneas de las tareas a eliminar, o bien comentarlas con el caracter #, lo que nos permitirá recuperarlas en otro momento.

### Comando Watch

- permite ejecutar un comando de forma periódica y mostrar su salida en pantalla completa.
- Útil para tareas que requieren ejecución frecuente y visualización continua de resultados.
- Facilita la monitorización de procesos y resultados en tiempo real.

#### Opciones Útiles

- -n X (Intervalo de Tiempo):

Especifica el intervalo de tiempo en segundos para ejecutar el comando.
Ejemplo: -n 1 ejecuta el comando cada segundo.

- -d (Resaltar Diferencias):

Resalta las diferencias entre las salidas consecutivas del comando.
Útil para detectar cambios o actualizaciones en la salida.

Otras Opciones:

- -p: Aumenta la precisión en el cálculo de los intervalos de tiempo.
- -b: Emite un sonido si el comando produce un error (código de error distinto de cero).

#### Ejemplo de Uso

Simular el comportamiento de top ejecutando el comando ps cada segundo y mostrando las diferencias:

**watch -n 1 -d ps aux**

### Tareas por Eventos

#### Introducción
- Las tareas por eventos se ejecutan en respuesta a eventos específicos en el sistema.
- Requieren herramientas especializadas o la creación de scripts personalizados.

#### Ejemplos de Tareas por Eventos
1. **Tareas cuando el Sistema está "Ocioso"**:
   - El comando `batch` (dentro del paquete `at`) ejecuta tareas cuando la carga del sistema es baja.
   - Ideal para tareas de relleno cuando la carga es baja.
   - Por defecto, las tareas se ejecutan cuando la carga baja por debajo de 1.5.

2. **Tareas Relacionadas con el Sistema de Archivos**:
   - El paquete `incron` permite programar tareas en respuesta a eventos en el sistema de archivos.
   - Ejemplos incluyen ejecutar una tarea cuando se crea un nuevo archivo, se modifica o se elimina.

3. **Tareas durante el Arranque de la Máquina**:
   - Se pueden especificar con `cron` utilizando el atajo `@reboot`.
   - También se pueden configurar con `update-rd.d`, si está disponible en la distribución.
   - Ejemplo: `@reboot sleep 300 && ~/mi_script.sh` para ejecutar una tarea 5 minutos después de iniciar el sistema.

4. **Tareas cuando se Conecta algún Usuario**:
   - Se pueden escribir los comandos en `/etc/profile.d/` (varía según la distribución).
   - Estos comandos se ejecutan cada vez que se inicia sesión un usuario.

5. **Tareas cada vez que se Abre una Terminal**:
   - Depende de la configuración de la shell del usuario.
   - En bash, se ejecuta el archivo `~/.bashrc` cada vez que se abre una terminal.
   - Se pueden definir configuraciones, alias de comandos, variables globales, etc.
   - Se debe tener cuidado al editar estos archivos, ya que afectan al funcionamiento del sistema.

# Windows/Batch

Hay varias opciones.

- Utilizando la Consola CMD:

    - Podemos emplear el comando **schtasks**, que permite indicar tareas programadas por tiempo (puntuales y repetitivas), por eventos, entre otras opciones.

```batch
schtasks /create /sc once /st 20:38 /tn tarea1  /tr c:\Windows\System32\calc.exe
```
Donde:
    - **/create**: crear la tarea
    - **/sc once**: tarea puntual. Con /sc podemos indicar la periodicidad, puede ser puntual (**once**), diaria (**daily**), semanal (**weekly**), mensual (**monthly**), al inicio (**onstart**), cuando cualquier usuario abre sesión (**onlogon**), cuando el sistema tiene baja carga (**onidle**), etc.
    - **/st** 20:30: hora de inicio
    - **/tn** tarea1: nombre de la tarea
    - **/tr** c:\Windows\System32\calc.exe: aplicación a ejecutar

- Nota, si tenemos dudas de la ruta donde se encuentra alguna aplicación, podemos usar el comando where. Por ejemplo, where calc.exe --> c:\Windows\System32\calc.exe

- Utilizando PowerShell:

    - PowerShell ofrece una familia de cmdlets relacionados con las tareas programadas: New-ScheduledTask, Get-ScheduledTask, etc.

### Tabla
| Tipo                                      | GNU/Linux                             | MS Windows (cmd)                 |
|-------------------------------------------|---------------------------------------|----------------------------------|
| Por tiempo (tareas puntuales)             | `at (-c, atq, atrm)`                  | `schtasks /sc ONCE`              |
| Por tiempo (tareas repetitivas)           | `crontab (-l, -e)`                    | `schtasks /sc HOURLY, DAILY, MONTHLY, etc.` |
| Por evento (baja carga)                   | `batch`                               | `schtasks /sc ONIDLE`            |
| Por evento (arranque)                     | `crontab @reboot`                     | `schtasks /sc ONSTART`           |
| Por evento (logon, cualquier usuario)     | `/etc/profile.d/`                     | `schtasks /sc ONLOGON`           |
|                                           |                                       | `shell:common startup`           |
| Por evento (login, usuario concreto)      | `$HOME/.profile`                      | `shell:startup`                  |
|                                           | `$HOME/.bashrc`                       |                                  |
| Por evento (cambio en directorios, ficheros, ...) | `incron`                         |                                  |
| Por evento (otros eventos)                | Programación propia                   | `schtasks /sc ONEVENT`           |



# GNU/Linux 

Resuelve los siguientes apartados. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione:

1. Guardar en un fichero llamado "cargaNextMonday.txt" situado en el HOME la carga del sistema el próximo lunes a las 2:00 am.

```bash
at next monday 2:00 <<< "uptime > ~/cargaNextMonday 2> carga.err"
# o
echo "uptime > ~/cargaNextMonday.txt 2> ~/carga.err" | at next monday 2:00
```

2. Guardar en un fichero llamado "cargaAllMondays.txt" situado en el HOME la carga del sistema TODOS los lunes a las 2:00 am

```bash
#abrir crontab

crontab -e

# añadir línea
  0   2  * * 1  uptime >> ~/cargaAllMondays.txt 2>> ~/carga.err
# min h dm m ds 
```

3. Guardar en un fichero llamado "carga30min.txt" situado en el HOME la carga del sistema cada 30 minutos de forma indefinida.

```bash
crontab -e

*/30 * * * * uptime >> ~/carga30min.txt 2>&1

```

4. Borrar todos los ficheros más antiguos de 30 días a las 3 de la mañana todos los días 10, 20 y 30 de cada mes.

```bash
0 3 10,20,30 * * find /home -type f -mtime +30 -exec rm {} \;

```
5. Realizar los siguientes pasos (crea un script con nombre "miscript.sh" en tu HOME que simplemente imprima la fecha en el formato: "Ahora mismo son las HH:MM del día DD/MM/YYYY"). En cada tarea haz que la salida se añada a un fichero llamado "datos_fecha.txt" localizado en tu HOME).
```bash
echo 'echo "Ahora mismo son las $(date +"%H:%M del día %d/%m/%Y")"' > ~/miscript.sh
chmod +x ~/miscript.sh

```
6. Ejecutar el script "~/miscript.sh" en 12 horas a partir de ahora.
```bash
at now + 12 hours -f ~/miscript.sh >> ~/backup.txt 2>> ~/backup.err
#o
at next monday 2:00 <<< "uptime > ~/cargaNextMonday 2> carga.err"
echo "~/miscript.sh" | at now + 12 hours

```

7. Ejecutar el script "~/miscript.sh" a las horas en punto de 8:00 a 12:00 (ambas inclusive) los fines de semana de febrero a abril (ambos inclusive).

```bash
crontab -e

0 8-12 * 2-4 6,7 ~/miscript.sh >> ~/datos_fecha.txt 2>&1


```

8. Ejecutar el script "~/miscript.sh" justo en una semana a partir de ahora.

```bash
at now + 1 week -f ~/miscript.sh >> ~/backup.txt 2>> ~/bakcup.err

echo "~/miscript.sh" | at now + 1 week

```
9. Ejecutar el script "~/miscript.sh" cada 4 horas durante los diez primeros días de cada mes.
```bash
crontab -e 

0 */4 1-10 * * ~/miscript.sh >> ~/datos_fecha.txt

```
10. Ejecutar el script "~/miscript.sh" sólo cuando la carga baje de 1.5.
```bash
batch << EOF
echo "~/miscript.sh" >> ~/datos_fecha.txt
EOF

```
11. Mostrar que las ejecuciones están programadas y esperando para ejecutarse.

```bash
atq
#o
crontab -l
```

12. Eliminar/comentar todas las ejecuciones programadas

```
atrm $(atq -q)
# o
crontab -r

```

# MS Windows
Crear un programa batch que muestre un mensaje y la fecha y hora y ejecutar este fichero según lo indicado (se debe añadir la salida en un fichero de texto):

1. El próximo lunes a las 12:50
```batch
schtasks /create /sc once /st 12:50 /tn tarea1 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
2. Todos los días a las 16:30
```batch
schtasks /create /sc daily /st 16:30 /tn tarea2 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
3. Todas las semanas a las 23:00.

```batch
schtasks /create /sc weekly /d MON /st 23:00 /tn tarea3 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
4. Todos los meses a las 11:00
```batch
schtasks /create /sc monthly /d 1 /st 11:00 /tn tarea4 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
5. Cuando el sistema tenga baja carga
```batch
schtasks /create /sc onidle /tn tarea5 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
1. Los lunes, miércoles y viernes a las 20:00
```batch
schtasks /create /sc weekly /d MON,WED,FRI /st 20:00 /tn tarea6 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
1. Mañana a las 12:00, y repetir la ejecución 5 veces cada 10 minutos
```batch
schtasks /create /sc once /sd %date% /st 12:00 /tn tarea7 /tr "cmd /c for /l %i in (1,1,5) do (echo Mensaje && echo Fecha y Hora: %date% %time%) && timeout /t 600" >> C:\Ruta\al\Fichero.txt

```

jesus
# Resumen Sistemas

<div align=center>
<img src="https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExMmswYzNmeWVtaDY2b3p6ajBoMXh6NHNtbWp0bGJncGhkNG13NzE1ayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/lgaHEvyUjdHY4/giphy.gif"/>
<br>
Aquí mis apuntes de sistemas.
</div>

<div align=justify>

## Índice

- [Servicios y demonios](#servicios-y-demonios)
- [Programación de tareas](#programación-de-tareas)

## Servicios y demonios

- Son procesos que llevan a cabo tareas especiales. En Linux se le conocen como 'demonios'.
- El nombre está inspirado en los _demonios de Maxwell_.
- Se ejecutan en segundo plano.
- Carecen de interfaz gráfica.
- No suelen hacer uso del input/output del usuario; si se da el caso, lo más común es que se realice mediante una aplicación _cliente_.
- Para indicar que un proceso es un servicio comúnmente se suele colocar una 'd' al final de su nombre. (Ex: cron / crond)
- Son gestionados y controlados por el sistema operativo (Sistema init de Linux, administrador de servicios de Windows...) y además de proporcionar operaciones básicas debe cumplir con ciertos protocolos.
- En entornos GNU/Linux, suelen ejecutarse con privilegios _root_ y la mayoría de las veces su proceso padre es el _init_ (PID 1).
- En la ejecución de un servicio existen dos tipos de usuarios: el _usuario real_ (quien ejecuta) y el _usuario efectivo_ (en donde se ejecuta).
- Al instalar aplicaciones de terceros pueden darse casos de la instalación de servicios asociados.

### Sistema Init de GNU/Linux

- Al encender un equipo UNIX se carga en memoria el kernel y luego se inicia, debiendo existir un proceso _padre_ que se encargue de iniciar directa o indirectamente a todos los procesos del sistema. Este proceso padre es el _init_, de PID 1, y es crucial para el funcionamiento del sistema operativo.
- El proceso _init_ también establece los __niveles de ejecución__ que indican qué servicios seran ejecutados. 
- Los sistemas de inicialización gestionan el proceso _init._
- El sistema de inicialización más actual es el __systemd__.
- La principal desventaja del _systemd_ es que es un sistema bastante complejo que acapara gran parte de las funciones de un kernel y rompe la filosofía de Linux de _"haz una sola cosa pero bien"_.

### Funcionamiento de los servicios 

- El servicio puede estar activado/desactivado (en funcionamiento o no), habilitado/deshabilitado (será iniciado durante el arranque, o no) y desenmascarado/enmascarado (puede o no ser iniciado por cualquier otro proceso o el arranque mismo).
- Al realizar los cambios de configuración en un servicio (normalmente encontrados en el directorio /etc) lo más probable es que sus cambios no sean aplicados hasta el siguiente inicio del servicio.
- El reinicio de un servicio es crítico y puede traer graves consecuencias por las interrupciones que pueden causarse. Para esto existen los comandos como `reload` que intentan recargar el servicio sin interrumpirlo para aplicar la nueva configuración.

### Runlevels (Niveles de ejecución)

Son 6 los niveles de ejecución:
- Runlevel 0: apagado o cierre del equipo
- Runlevel 1: Monousuario (solo root), sin red ni entorno gráfico. Usado como modo de emergencia para solucionar problemas.
- Runlevel 2: Multiusuario, sin red ni entorno gráfico.
- Runlevel 3: Multiusuario, con soporte de red pero sin entorno gráfico.
- Runlevel 4: Reservado.
- Runlevel 5: Modo normal de uso.
- Runlevel 6: Reboot del equipo.

## Programación de tareas

- Algunas tareas que suelen programarse por su larga duración o consumo de memoria/cpu, suelen ser las copias de seguridad, migraciones, baterías de tests, auditorías de seguridad...
- Hay varios tipos de tareas programadas, como las de __tiempo__ (se ejecutan en una fecha/hora determinada), como por __evento__ (se ejecutan bajo algún hecho determinado del equipo).
- Estás tareas son realizadas por servicios que estarán activas monitorizando el tiempo o los eventos que _disparen_ (__"Triggers"__) y desencadenan tareas.
- Si el servicio no estuviera activo al momento que debe ejecutarse la tarea, este puede ignorarse, ejecutarse al iniciarse nuevamente, reprogramarse... dependiendo de la configuración del servicio.
- Por lo general estas tareas programadas son ejecutadas en una _terminal virtual_ cuyos datos de output (stdout y stderr), se pierden al finalizar la ejecución.
- Por otro lado, el directorio en el que se ejecutan las tareas no suele ser el esperado y por eso se recomiendo el uso de rutas absolutas para especificar ficheros.
- Usa redirecciones (> >> <<<) para almacenar la información y evitar su pérdida en la terminal virtual. Si hubiesen entradas de teclado, también se debe redirigir la entrada (stdin).

### Tareas por tiempo: puntuales (Comando At)

- Se suele usar el comando `at` (normalmente no viene instalada por defecto en el sistema UNIX).
- La hora se puede indicar tanto en el formato de 12 horas como el de 24. Las fechas, como recomendación, se indican en el formato japonés (YY-MM-DD)
- También soporta el uso de 'lenguaje natural' como _tomorrow, tuesday, next week, now + 10 minutes_, y _noon, midnight, teatime..._
- Una vez se invoca el comando `at` con una fecha determinada (Ex: `at 20:00 tomorrow`), se abre un pequeño intérprete de código para programar las tareas.
- Después de especificar los comandos y su redirección (Ex: `who >> ~/usuarios.txt 2>> ~/usuarios.err`), sales del intérprete con CTRL+D.
- Para mostrar la lista de tareas programadas: `atq` o `at -l`.
- Para mostrar los detalles de una tarea por su id: `at -c id`.
- Para borrar una tarea por su id: `atrm id` o `at -r id` o `at -d id`.

### Tareas por tiempo: repetitivas (Comando Cron)

- Hace referencia a Cronos.
- No posee un cliente para especificar una tarea, sino que deben escribirse en una tabla (crontab) con formato especial.
- Esta tabla es leida por el demonio _cron_ (_crond_ en algunos sistemas)
- Para editar la tabla, se debe ejecutar `crontab -e`.
- El formato que sigue es:
    1. __m__: minutos (de 0 a 59)
    2. __h__: hora (de 0 a 23)
    3. __dom__: día del mes (del 1 al 31 dependiendo del mes)
    4. __mon__: mes (de 1 a 12)
    5. __dow__: día de la semana donde 0 es domingo, 1 es lunes, 2 es martes...
    6. __command__: comando o script a ejecutar.

Un ejemplo de aplicación es:

    Usar un script para borrar ficheros temporales todos los días a las 12:15
    m h dom mon dow cmd
    15 12 * * * ~/borrar_temporales.sh >> ~/borrar_temporales.out 2>> ~/borrar_temporales.err

Los valores también se pueden especificar en estos símbolos:
- Cualquier valor: *
- Rangos (-): 4-8 (ambos inclusive)
- Lista (,): 3,6,9,12
- Intervalos (/): */5 (cada 5 = 0,5,10,15)
- Son combinables: 6-12/2 = 6,8,10,12

Otra operaciones utiles:
- Listar todas las tareas: `crontab -l`
- Borrar todas las tareas: `crontab -r`
- Para borrar una tarea en específico, se debe ingresar a la tabla y borrar su línea o comentarla con #

### Comando Watch

- Cron tiene una precisión de minutos, por lo que no es capaz de ejecutar tareas rápidamente en segundos, para eso usamos el comando Watch
- Ejecuta un comando de forma periódica, mostrando la salida en pantalla completa.
- Entre sus opciones se encuentra `-n X` (ejecuta el comando cada X segundos), `-d` (resalta diferencias en la salida), `-p` (aumenta la precisión en el cálculo de intervalos del tiempo), `-b` (emite un sonido si el comando arroja algún error).
- Un ejemplo del comando watch, en el que se simula el funcionamiento de `top`: `watch -n 1 -d ps aux`

### Tareas por eventos

- __Tareas cuando el sistema está "ocioso" (con baja carga, _idle_):__ el comando `batch`, encontrado en el paquete de `at`.
- __Tareas relacionadas con el sistema de ficheros__: el paquete `incron` (ejecutar una tarea al crear o borrar ficheros...)
- __Durante el arranque__: con el atajo @reboot en cron, si este lo soporta (Ex: `@reboot sleep 300 && ~/mi_script.sh`)
- __Cuando un usuario se conecta__: escribiendo los comandos en /etc/profile.d/
- __Cuando se abre una terminal__: escribiendo los comandos al final del fichero ~/.bashrc

## Usuarios y grupos

- El concepto de usuarios en Linux permite separar entornos de ejecución para diferentes propositos.
- Es común que muchos servicios del sistema tengan su propio usuario para restringir el acceso como mecanismo de seguridad. 
- La configuración de los usuarios se maneja en los ficheros /etc/passwd y /etc/shadow

### /etc/passwd

- Contiene la información de las cuentas de usuario y características.
> El formato es name:password:UID:GID:GECOS:directory:shell

Un ejemplo de usuario es:
> avahi:x:115:120:Avahi mDNS daemon,,,:/var/run/avahi-daemon:/bin/false

### /etc/shadow

- Contiene la información de las contraseñas de forma cifrada.
> El formato es name:password:lastmod:min:max:aviso:inactividad:expiración:reservado

- Sobre el campo de password, puede haber un * (nunca ha tenido un password), o ! (ha sido deshabilitada).
- Cuando se bloquea un usuario con `usermod -l user`, se añade un ! al comienzo del hash del password para indicar que se ha bloqueado.

### Gestión de usuarios y contraseñas

- Los comandos básicos para la gestión de usuarios son:
    - Crear un usuario: `useradd`
    - Borrar un usuario: `userdel`
    - Modificar un usuario: `usermod` (Tiene una opción para todos los campos de /etc/shadow excepto GECOS. Incluye la opción de lock/unlock)
    - Modificar GECOS: `chfn`
    - Modificar shell: `chsh`
    - Modificar fechas de contraseña de /etc/shadow: `chage`
    - Para cambiar la contraseña: `passwd user`__
    - Para visualizar la información de GECOS: `finger user`.

### Gestión de grupos

Los grupos permiten conceder permisos a un conjunto de usuarios simultáneamente.
Existen los __grupos primarios__ (que consta como GID en /etc/passwd, pudiendo ser solo uno) y los __grupos secundarios__ (gestionados en el fichero /etc/groups, donde pueden haber varios usuarios).

### /etc/group

- Consta del siguiente formato: _name:passwd:GID:miembros_
- De forma similar a /etc/shadow, existe una versión para grupos, __/etc/gshadow__
- Los comandos básicos para la gestión del grupo son:
    - Crear un grupo: `groupadd`
    - Borrar un grupo: `groupdel`
    - Modificar un campo de /etc/groups: `groupmod`
    - Modificar el password del grupo: `gpasswd`
- Para cambiar los grupos de un usuario, se suelen usar las siguientes opciones del `usermod`:
    - Modificar grupo primario: `usermod -g GROUP user`
    - Modificar grupos secundarios: `usermod -G GROUP user`
    - Añadir a un grupo secundario SIN SOBRESCRIBIR: `usermod -a -G GROUP user`

</div>

rashi
# PROGRAMACIÓN DE TAREAS
- Algunas tareas que suelen programarse por su larga duración o consumo de memoria/cpu, suelen ser las copias de seguridad, migraciones, baterías de tests, auditorías de seguridad...
- Hay varios tipos de tareas programadas, como las de __tiempo__ (se ejecutan en una fecha/hora determinada), como por __evento__ (se ejecutan bajo algún hecho determinado del equipo).
- Estás tareas son realizadas por servicios que estarán activas monitorizando el tiempo o los eventos que _disparen_ (__"Triggers"__) y desencadenan tareas.
- Si el servicio no estuviera activo al momento que debe ejecutarse la tarea, este puede ignorarse, ejecutarse al iniciarse nuevamente, reprogramarse... dependiendo de la configuración del servicio.
- Por lo general estas tareas programadas son ejecutadas en una _terminal virtual_ cuyos datos de output (stdout y stderr), se pierden al finalizar la ejecución.
- Por otro lado, el directorio en el que se ejecutan las tareas no suele ser el esperado y por eso se recomiendo el uso de rutas absolutas para especificar ficheros.
- Usa redirecciones (> >> <<<) para almacenar la información y evitar su pérdida en la terminal virtual. Si hubiesen entradas de teclado, también se debe redirigir la entrada (stdin).

## Tareas por tiempo: puntuales (Comando At)
- Se suele usar el comando `at` (normalmente no viene instalada por defecto en el sistema UNIX).
- La hora se puede indicar tanto en el formato de 12 horas como el de 24. Las fechas, como recomendación, se indican en el formato japonés (YY-MM-DD)
- También soporta el uso de 'lenguaje natural' como _tomorrow, tuesday, next week, now + 10 minutes_, y _noon, midnight, teatime..._
- Una vez se invoca el comando `at` con una fecha determinada (Ex: `at 20:00 tomorrow`), se abre un pequeño intérprete de código para programar las tareas.
- Después de especificar los comandos y su redirección (Ex: `who >> ~/usuarios.txt 2>> ~/usuarios.err`), sales del intérprete con CTRL+D.
- Para mostrar la lista de tareas programadas: `atq` o `at -l`.
- Para mostrar los detalles de una tarea por su id: `at -c id`.
- Para borrar una tarea por su id: `atrm id` o `at -r id` o `at -d id`.

## Tareas por tiempo: repetitivas (Comando Cron)
- Hace referencia a Cronos.
- No posee un cliente para especificar una tarea, sino que deben escribirse en una tabla (crontab) con formato especial.
- Esta tabla es leida por el demonio _cron_ (_crond_ en algunos sistemas)
- Para editar la tabla, se debe ejecutar `crontab -e`.
- El formato que sigue es:
    1. __m__: minutos (de 0 a 59)
    2. __h__: hora (de 0 a 23)
    3. __dom__: día del mes (del 1 al 31 dependiendo del mes)
    4. __mon__: mes (de 1 a 12)
    5. __dow__: día de la semana donde 0 es domingo, 1 es lunes, 2 es martes...
    6. __command__: comando o script a ejecutar.

Un ejemplo de aplicación es:

    Usar un script para borrar ficheros temporales todos los días a las 12:15
    m h dom mon dow cmd
    15 12 * * * ~/borrar_temporales.sh >> ~/borrar_temporales.out 2>> ~/borrar_temporales.err

Los valores también se pueden especificar en estos símbolos:
- Cualquier valor: *
- Rangos (-): 4-8 (ambos inclusive)
- Lista (,): 3,6,9,12
- Intervalos (/): */5 (cada 5 = 0,5,10,15)
- Son combinables: 6-12/2 = 6,8,10,12

Otra operaciones utiles:
- Listar todas las tareas: `crontab -l`
- Borrar todas las tareas: `crontab -r`
- Para borrar una tarea en específico, se debe ingresar a la tabla y borrar su línea o comentarla con #

## Comando Watch
- Cron tiene una precisión de minutos, por lo que no es capaz de ejecutar tareas rápidamente en segundos, para eso usamos el comando Watch
- Ejecuta un comando de forma periódica, mostrando la salida en pantalla completa.
- Entre sus opciones se encuentra `-n X` (ejecuta el comando cada X segundos), `-d` (resalta diferencias en la salida), `-p` (aumenta la precisión en el cálculo de intervalos del tiempo), `-b` (emite un sonido si el comando arroja algún error).
- Un ejemplo del comando watch, en el que se simula el funcionamiento de `top`: `watch -n 1 -d ps aux`

## Tareas por eventos
- __Tareas cuando el sistema está "ocioso" (con baja carga, _idle_):__ el comando `batch`, encontrado en el paquete de `at`.
- __Tareas relacionadas con el sistema de ficheros__: el paquete `incron` (ejecutar una tarea al crear o borrar ficheros...)
- __Durante el arranque__: con el atajo @reboot en cron, si este lo soporta (Ex: `@reboot sleep 300 && ~/mi_script.sh`)
- __Cuando un usuario se conecta__: escribiendo los comandos en /etc/profile.d/
- __Cuando se abre una terminal__: escribiendo los comandos al final del fichero ~/.bashrc

# USUARIOS Y GRUPOS
## GNU/Linux
## Administración de usuarios
- crear nuevo usuario `sudo useradd nuevousuario`
(esto crea un grupo llamado igual por defecto y un directorio /home/nuevousuario)
- añadir a un grupo `useradd nuevousuario -g grupoprincipal` (el grupo debe existir)
- especificar el directorio `useradd -d /home/otrodirectorio`
- especificar nombre de usuario `useradd -c "Julia Schneider" julia`
- borrar un usuario: `userdel`
- modificar un usuario: `usermod` (Tiene una opción para todos los campos de /etc/shadow excepto GECOS. Incluye la opción de lock/unlock)
- modificar GECOS: `chfn`
- modificar shell: `chsh`
- modificar fechas de contraseña de /etc/shadow: `chage`
- para cambiar la contraseña: `passwd user`__
- para visualizar la información de GECOS: `finger user`.

### siglas
`-g` se usa para añadir al grupo principal <br>
`-G` agregar a grupo secundario(tantos como quiera)

Ejemplo: 
 > useradd nuevousuario -g grupoprincipal -G gruposecundario1,gruposecundario2

## Contraseñas
- para asignar una contraseña `sudo passwd julia`
- bloquear o desbloquear contraseña (poder o no cambiarla) <br>
`-l` , `--lock`, bloquearla <br>
`-u` , `--unlock`, desbloquearla
- establecer máximo de contraseña (hasta que expire)
--maximum=DÍAS `passwd --maximum=90 julia`
(así el usuario julia tendrá una contraseña que expire en 90 días)

## operaciones
### usermod
- cambiar nombre de inicio de sesión de usuario `usermod -l nombreantiguo nombrenuevo`
- cambiar el directorio de un usuario `usermod -d /nuevo/directorio -m nombreususario`
- agregar usuarios a grupos secundarios `usermod -G grupo1, grupo2, grupo3`
- ponerle fecha de expiración con formato AAAA-MM-DD `usermod --expiredate 2024-05-02 nombredeusuario`
- bloquear contraseña de usuario `usermod --lock nombreusuario`
- desbloquear contraseña de usuario `usermod --unlock nombreusuario`
- BORRAR CUENTA (debes ser root) `sudo userdel nombreusuario`--no borra los archivos
- borrar cuenta y forzar borrar su directorio y archivos `sudo userdel -rf nombreusuario` --forzar a borrar directorio y cuenta
- ver grupos que pertenecen a usuario `groups nombreusuario`

#### siglas
`-m` es de move <br>
`-d` de directorio

### Comando chage
- cambia número de días en los que se tiene que cambiar la contraseña `chage --list nombredeusuario` --muestra info respecto a contraseña de usuario
- establecer máximo días contraseña `chage -M 90 nombredeusuario`
- establecer contraseña como expirada (pedirá una nueva al usuario) `chage -d 0 username`

## etc/ passwd
Base de datos de usuarios del sistema. Cada línea es un usuario, y la info de este se separa mediante :

- Contiene la información de las cuentas de usuario y características.
> Cuenta (nombre de usuario) : Contraseña : UID (ID de usuario) : GID (ID de grupo) : GECOS (campo opcional con propósitos informativos) : Directorio (directorio principal o home del usuario) : shell (ruta al shell predeterminado, campo opcional)

Un ejemplo de usuario es:
> julia:x:504:506:Julia Schneider:/home/julia:/bin/bash

- Para ver el contenido del archivo: `cat /etc/passwd`

## etc/shadow
Archivo que guarda las contraseñas de los usuarios en formato encriptado, además de info del usuario

El formato es 
> name:password:lastmod:min:max:aviso:inactividad:expiración:reservado

Un ejemplo de contraseña es:
> julia:Z9B3Qve$f7tlKI8Shimc9ZDx.7KQGFBxFUrAX2xzMEOJVJ7YcEhePU5cR8Lo09V25aFbWe51eu3047K7kTlQJ3LG1K15y1:17043:0:90:7:::

- Sobre el campo de password, puede haber un * (nunca ha tenido un password), o ! (ha sido deshabilitada).
- Cuando se bloquea un usuario con `usermod -l user`, se añade un ! al comienzo del hash del password para indicar que se ha bloqueado.

## Administración de grupos
Conjunto de cuentas de usuarios que comparten permisos. A todos los usuarios se les asigna un identificador de usuario (uid) y de grupo (gid).

Ver los grupos disponibles con archivo:

## /etc/group
- Consta del siguiente formato: _name:passwd:GID:miembros_
- De forma similar a /etc/shadow, existe una versión para grupos, __/etc/gshadow__
- En cuanto a Usuarios:
    - El 0 es el root
    - luego reservados para el sistema hasta el 500
    - hasta el 999 para demonios o aplicaciones para el sistema
    - del 1000 hacia arriba son usuarios normales

### siglas
`-a` de add
`-d` de delete

### operaciones
- crear un nuevo grupo `groupadd nombregrupo`
- si queremos que sea un grupo que use el sistema `groupadd -r nombregrupo`
- cambiar nombre del grupo `groupmod -n gruponuevo grupoantiguo`
- agregar usuario a grupo con gpasswd `gpasswd -a nombredeusuario nombredegrupo`
- eliminar usuario de grupo `gpasswd -d nombredeusuario nombredegrupo`
- borrar grupo `groupdel nombredelgrupo`
- modificar grupo primario: `usermod -g GROUP user`
- modificar grupos secundarios: `usermod -G GROUP user`
- añadir a un grupo secundario SIN SOBRESCRIBIR: `usermod -a -G GROUP user`

## Getent
es un comando para consultar las bases de datos del sistema de nombres, como **`/etc/passwd`**, **`/etc/group`**, **`/etc/hosts`**

Ejemplo:
> sudo useradd -d /home/kaiman -k /etc/skel/ -g pruebas -G lpadmin -m -s /bin/bash kaiman

> Este comando crea un nuevo usuario llamado "kaiman" con un directorio de inicio en **`/home/kaiman`**, usando la configuración de **`/etc/skel/`** como base, asignándolo al grupo primario "pruebas" y al grupo secundario "lpadmin", asignándole **`/bin/bash`** como su shell predeterminado.

- para cambiar de usuario `su pepito`
- para cambiar de usuario `su nombreusuario`
- para añadir darle a usuario permiso de administrador `sudo usermod -G sudo nombreusuario`


## Windows
- `net user`: Muestra la lista de usuarios en el sistema.

- `net user ssf`: Muestra información detallada del usuario "ssf", incluyendo su nombre completo, si tiene una contraseña asignada, y su configuración de cuenta.

- `net user prb1 /add`: Agrega un nuevo usuario llamado "prb1" al sistema. Por defecto, este usuario tendrá una configuración mínima.

- `net localgroup`: Permite visualizar los grupos locales disponibles en el sistema.

- Crear grupo: `net localgroup Impresora /add`: Crea un nuevo grupo local llamado "Impresora".

- Añadir a un grupo: `net localgroup Impresora /add prb1`: Agrega al usuario "prb1" al grupo "Impresora".

- Borrar de un grupo: `net localgroup Impresora /del prb1`: Elimina al usuario "prb1" del grupo "Impresora".

- `net user prb2 */add`: Crea un nuevo usuario llamado "prb2" y solicita una contraseña al momento de crearlo.

Ejemplo: 
> `net user prb2 */add /active`: no /expires:10/10/2024 /times:L-V,14:00-21:00 /fullname:"Jesusito" /passwordreq:yes:

> Lo que hace esto es: <br>
    - Crea un nuevo usuario llamado "prb2". <br>
    - Desactiva la cuenta hasta que se active manualmente. <br>
    - Establece la fecha de vencimiento de la cuenta para el 10 de octubre de 2024. <br>
    - Define un horario de inicio de sesión válido solo de lunes a viernes, de 14:00 a 21:00. <br>
    - Establece el nombre completo del usuario como "Jesusito". <br>
    - Requiere que se establezca una contraseña para el usuario.

- Añadir a administrador (y quitar de usuarios): `net localgroup Administradores /add prb2`: Agrega al usuario "prb2" al grupo de administradores y lo elimina del grupo de usuarios estándar.

- Activar cuenta: `net user prb2 /active:yes`: Activa la cuenta del usuario "prb2".

- Cambiar las horas de inicio de sesión: `net user prb2 /times`: Permite modificar el horario de inicio de sesión del usuario "prb2".

- `net accounts`: Muestra información global de la configuración de cuentas del sistema, incluyendo la longitud mínima de la contraseña, la duración de la contraseña y otras políticas de seguridad.

Configuración de la contraseña: 
> net accounts /minpwlen:12 /minpwage:7 /maxpwage:30 /uniquepw:3: 

> Establece las siguientes políticas de contraseña: <br>
    - Longitud mínima de la contraseña: 12 caracteres. <br>
    - Edad mínima de la contraseña: 7 días. <br>
    - Edad máxima de la contraseña: 30 días. <br>
    - Número de contraseñas únicas requeridas: 3.

# Dónde está la info de cada resumen:
- Usuario: /etc/passwd
- Contraseña de bloqueo: /etc/shadow
- Grupo: /etc/group
- Contraseña grupo: /etc/gshadow


# HOJA DE EJERCICIOS DE PROGRAMACIÓN DE TAREAS
## GNU/Linux 

Resuelve los siguientes apartados. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione:
1. Guardar en un fichero llamado "cargaNextMonday.txt" situado en el HOME la carga del sistema el próximo lunes a las 2:00 am
```bash
Echo “uptime” | at 2:00am next monday > ~/cargaNextMonday.txt
```

2. Guardar en un fichero llamado "cargaAllMondays.txt" situado en el HOME la carga del sistema TODOS los lunes a las 2:00 am
```bash
crontab -e
0 2 * * 1 uptime > ~/cargaAllMondays.txt
```

3. Guardar en un fichero llamado "carga30min.txt" situado en el HOME la carga del sistema cada 30 minutos de forma indefinida
```bash
crontab -e
*/30 * * * * uptime > ~/carga30min.txt
```

4. Borrar todos los ficheros más antiguos de 30 días a las 3 de la mañana todos los días 10, 20 y 30 de cada mes
```bash
crontab -e
0 3 10,20,30 * * find ~/ -type f -mtime +30 -exec rm {} \;
```

5. Realizar los siguientes pasos (crea un script con nombre "miscript.sh" en tu HOME que simplemente imprima la fecha en el formato: "Ahora mismo son las HH:MM del día DD/MM/YYYY"). En cada tarea haz que la salida se añada a un fichero llamado "datos_fecha.txt" localizado en tu HOME.
```bash
#!/bin/bash

echo "Ahora mismo son las $(date +%H:%M) del día $(date +%d/%m/
%Y)" >> ~/datos_fecha.txt
```

1. Ejecutar el script "~/miscript.sh" en 12 horas a partir de ahora.
```bash
Echo “miscript.sh” | at now + 12 hours
```
2. Ejecutar el script "~/miscript.sh" a las horas en punto de 8:00 a 12:00 (ambas inclusive) los fines de semana de febrero a abril (ambos inclusive)
```bash
Crontab -e
0 8-12 * 2-4 6,7 ~/miscript.sh
```
3. Ejecutar el script "~/miscript.sh" justo en una semana a partir de ahora.
```bash
Echo “miscript.sh” | at now + 1 week
```
4. Ejecutar el script "~/miscript.sh" cada 4 horas durante los diez primeros días de cada mes.
```bash
Crontab -e
0 */4 1-10 * * ~/miscript.sh
```
5. Ejecutar el script "~/miscript.sh" sólo cuando la carga baje de 1.5
```bash
batch -f ~/miscript.sh
```
6. Mostrar que las ejecuciones están programadas y esperando para ejecutarse
```bash
atq
```
7. Eliminar/comentar todas las ejecuciones programadas
```bash
atrm id_tarea
```


## MS Windows
Crear un programa batch que muestre un mensaje y la fecha y hora y ejecutar este fichero según lo indicado (se debe añadir la salida en un fichero de texto):
```cmd
@echo off

set "fecha=%date%"

set “hora=%time%"

echo Mensaje de ejemplo - Fecha: %fecha% - Hora: %hora% >> fecha_hora.txt
```

1. El próximo lunes a las 12:50
```cmd
schtasks /create /“tarea lunes” /tr “C:\ruta\miscript.bat” /sc once /d MON /st 12:50
```

2. Todos los días a las 16:30
```cmd
schtasks /create /“tarea diaria” /tr “C:\ruta\miscript.bat” /sc daily /st 16:30
```

3. Todas las semanas a las 23:00
```cmd
schtasks /create /“tarea semanal” /tr “C:\ruta\miscript.bat” /sc weekly /st 23:50
```

4. Todos los meses a las 11:00
```cmd
schtasks /create /“tarea mensual” /tr “C:\ruta\miscript.bat” /sc
monthly/st 11:00
```

5. Cuando el sistema tenga baja carga
```cmd
schtasks /create /“tarea cargabaja” /tr “C:\ruta\miscript.bat” /sc onidle
```

6. Los lunes, miércoles y viernes a las 20:00
```cmd
schtasks /create /“tarea l-m-v” /tr “C:\ruta\miscript.bat” /sc weekly /d
MON,WED,FRI /st 20:00
```

7. Mañana a las 12:00, y repetir la ejecución 5 veces cada 10 minutos
```cmd
schtasks /create /“tarea rep” /tr “C:\ruta\miscript.bat” /sc once /sd
tomorrow /st 12:00 et/ 6:00 /mo 10 minute /ri 5
```


# HOJA DE EJERCICIOS DE USUARIOS Y GRUPOS
## GNU/Linux 
Resuelve los siguientes apartados en la máquina virtual de GNU/Linux. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione:

1. Muestra todos los usuarios de tu máquina virtual. ¿Dónde está esa información? ¿Qué datos guarda el sistema sobre sus usuarios y cómo se organizan?
```bash
cat /etc/passwd
```
En este archivo se encuentra toda la información de los usuarios. Cada línea es un usuario, y en esta línea se encuentra la siguiente información: Cuenta (nombre de usuario) : Contraseña : UID (ID de usuario) : GID (ID de grupo) : GECOS (campo opcional con propósitos informativos) : Directorio (directorio principal o home del usuario) : shell (ruta al shell predeterminado, campo opcional)

2. ¿Por qué hay tantos usuarios? De todos ellos, ¿cuáles realmente pueden abrir una consola de comandos? ¿cuáles podrían inciar una sesión con una contraseña válida? ¿Cómo sabes estos datos? ¿Por qué crees que es así?
```bash

```

3. Fíjate en el UID de los usuarios. ¿Ves alguna diferencia entre los usuarios con UID < 1000 y los que tiene un UID >= 1000? ¿Por qué es así?
```bash

```

4. Muestra todos los grupos de tu máquina virtual. ¿Dónde está esa información? ¿Qué datos guarda el sistema sobre sus grupos y cómo se organizan?
```bash

```

5. ¿Por qué hay tantos grupos? Intenta buscar información sobre qué funciones tienen los diferentes grupos de tu sistema, en los apuntes hay un enlace con algo de información.
```bash

```

6. ¿Cómo comprobarías si un usuario existe ya en el sistema? ¿Y un grupo?
```bash

```

7. Crea el usuario "test01" de forma que su home sea /home/test01 (se deben copiar la configuración básica de /etc/skel) y su shell sea /bin/bash.
```bash
sudo useradd -m -d /home/test01 -s /bin/bash test01
```

8. Intenta abrir una sesión como "test01" una vez creado... ¿puedes? ¿Por qué? ¿Cómo lo arreglarías?

No se puede porque no se le ha asignado una contraseña. Para ello se usa el comando: 
```bash
sudo passwd test01
```

9. El usuario "test01", ¿qué grupo principal tiene? Cámbialo para que sea su grupo principal sea "tests".
```bash
sudo usermod -g tests test01
```

10. Borra el grupo principal antiguo de test01, ¿puedes eliminarlo? ¿Por qué?
```bash
sudo groupdel test01
```
Sí se puede, porque se permite eliminar si el grupo no está siendo utilizado por ningún usuario como grupo principal o secundario.

11. Borra el grupo "tests", ¿puedes eliminarlo? ¿Por qué?

No, porque test01 está usando ese grupo.

12. Asigna algunos grupos secundarios a "test01". Indica para qué sirve cada uno de los grupos creados

Para agregar a grupos secundarios se usa el comando usermod:
```bash
 sudo usermod -G grupo1,grupo2 test01
```
Estos grupos son creados con:
```bash
sudo groupadd group1
```

13. Asigna algunos grupos más secundarios a "test01", SIN borrar los que ya tenía
```bash
sudo usermod -aG nuevogrupo1 test01 
```
Se usa la -a para no eliminar los que ya tenía.

14. Elimina algunos grupos secundarios del usuario test01
```bash
sudo gpasswd -d test01 grupoaeliminar
```

15. Bloquea al usuario test01. Luego intenta abrir una sesión... ¿puedes? ¿Por qué?
```bash
sudo passwd -l test01
```
No, porque con este comando hace que se caduque la contraseña.

16. Desbloquea al usuario test01. ¿Se ha perdido algo de su información?
```bash
sudo passwd -u test01
```
No debería haber perdido información

17. Cambia la información de test01 indicando su nombre completo, oficina, teléfono, etc.
```bash
sudo chfn test01
```
Este comando te da opciones de escribir o modificar todos esos datos.

18. Cambia la shell de test01 a una que no permita ejecutar comandos
```bash
sudo chsh -s /bin/false test01
```

19. Vuelve a dejarle a test01 su shell original
```bash
sudo chsh -s /bin/bash test01
```

20. Añade restricciones al usuario test01 de forma que tenga que cambiar la contraseña cada 15 días y que le avisen 3 días antes, dándole 2 días de margen para poder cambiar una contraseña caducada sin que se bloquee su cuenta. Además, la cuenta quedará deshabilitada el 30 de junio.
```bash
sudo chage -M 15 -W 3 -I 2 -E 2023-06-30 test01
```
**chage**: Es el comando utilizado para modificar la configuración de la contraseña de un usuario. <br>
**-M 15**: Establece el máximo número de días antes de que la contraseña del usuario expire. En este caso, se establece en 15 días, lo que significa que el usuario "test01" tendrá que cambiar su contraseña cada 15 días. <br>
**-W 3**: Establece el número de días de advertencia antes de que la contraseña expire. En este caso, se establece en 3 días, lo que significa que el usuario "test01" recibirá una advertencia 3 días antes de que su contraseña expire. <br>
**-I 2**: Establece el número de días de inactividad antes de que la cuenta del usuario se desactive automáticamente. En este caso, se establece en 2 días, lo que significa que si el usuario "test01" no inicia sesión durante 2 días, su cuenta se desactivará automáticamente. <br>
**-E 2023-06-30**: Establece la fecha de caducidad para la cuenta del usuario. En este caso, se establece en el 30 de junio de 2023, lo que significa que la cuenta del usuario "test01" se desactivará automáticamente en esa fecha.

21. Elimina el usuario test01 con todo el contenido en su espacio personal. Ten en cuenta que test01 podría seguir conectado.
```bash
sudo userdel -rf test01
```

22. ¿Qué pasaría si test01 siguiera conectado en el momento que se elimina su cuenta? ¿Podría seguir usando el equipo con normalidad? ¿Cómo harías para cerrar inmediatamente todos sus procesos que estuvieran aún en ejecución?
```bash
sudo pkill -u test01 -9
```


## MS Windows

1. ¿Por qué MS Windows distingue entre usuarios/grupos locales y globales?

Windows distingue entre usuarios/grupos locales y globales para gestionar de manera eficiente los recursos y permisos dentro de un sistema. Los usuarios y grupos locales se aplican solo al sistema en el que están definidos, mientras que los usuarios y grupos globales pueden ser utilizados en toda la red de dominio.

2. Muestra todos los usuarios locales de tu máquina virtual. ¿Cuál es la función de cada usuario?
```cmd
net user
```
Está Administrador, rcn, Utility, Invitado, .y cada usuario puede tener diferentes funciones dependiendo de cómo se configuren los permisos y las políticas de seguridad en el sistema.

3. Muestra información detallada del usuario que estás usando ahora mismo. ¿Qué significa cada línea? ¿A qué grupos perteneces?
```cmd
net user rcn
```

4. Muestra todos los grupos locales de tu máquina virtual. ¿Qué función tiene cada grupo (busca unos cuantos)?
```cmd
net localgroup
```

5. Muestra información detallada del grupo "Usuarios". ¿Quién pertenece a este grupo? Repite la operación para el grupo de "Administradores"
```cmd
net localgroup Usuarios
```
Tiene como comentario: “Los usuarios no pueden hacer cambios accidentales o intencionados en el sistema y pueden ejecutar la mayoría de aplicaciones.” Pertenecen: “rcn NT AUTHORITY\INTERACTIVE NT AUTHORITY\Usuarios autentificados”

```cmd
net localgroup Administradores
```
Tiene como comentario “Los administradores tienen acceso completo y sin restricciones al equipo o dominio” Y pertenecen: Administrador rcn

6. Crea un usuario test01 SIN indicar contraseña
```cmd
net user test01 /add /passwordreq:no
```

7. Crea un usuario test02 indicando la contraseña en el propio comando
```cmd
net user test02 contraseña /add
```

8. Crea un usuario test03 y solicita que se indique la contraseña por teclado, sin mostrarla
```cmd
net user test03 * /add
```
Esto solicitará la contraseña sin mostrarla mientras se escribe.

9. Prueba a abrir sesión con los usuarios creados. ¿Puedes acceder con todos? Si no puedes acceder con alguno(s), indica cuál es el problema y soluciónalo.
```cmd
net user nombreusuario
```



11. Crea un grupo local llamado Informática. Añade los tres usuarios anteriores a ese grupo y muestra la lista de usuarios del grupo para ver que así es.
```cmd
net localgroup Informática /add
net localgroup Informática test01 /add
net localgroup Informática test02 /add
net localgroup Informática test03 /add
```
jose 

# Tareas Programadas

Antes de hacer cualquier tarea programada, debemos saber lo siguiente:

- Usar siempre rutas absolutas para especificar los scripts, ficheros de entrada, de salida, etc. (Ej: /etc/apt/sources.list , /home/alumno/bashrc)

- Usar redirecciones para almacenar en ficheros los mensajes y datos de salida (stdout) y/o errores (stderr) si deseas conservarlos al finalizar la tarea. Si hubiera entradas por teclado, como evidentemente no va a ser posible usarlo, deberíamos redirigir también la entrada (stdin).

- Al no ejecutarse las tareas en terminales "normales", no podemos confiar en que cargue la configuración que hayamos indicado en nuestra shell habitual, así que NO debemos usar variables de entorno propias, alias o cualquier otro tipo de configuración que se ejecuta al iniciar la shell.

## Linux

### Tareas por tiempo (puntuales)

En Linux no suelen venir instaladas aplicaciones para esto, por ello el paquete más importante de estos es el llamada "at". Normalmente at suele ser invocado con varias formas:
 
- Formato (horas): 12H AM/PM o también formatos especificos como `noon (12:00)`, `midnight (0:00)`, etc.
- Formato (fecha): La más comun, la japonesa, hecha de ña siguiente manera: `YY-MM-DD`, aunque hay más formatos
- Formato (lenguaje natural): Esto solo funcioan en inglés `next month (siguiente mes)`, `now + 10 min (desde ahora + 10 minutos)`, `next week - 2 days (la próxima semana - 2 días)`

Una vez que se ha invocado el at, se nos abre una pequeña terminal, en la cual podemos jugar con at. Podemos salir de el simplemente pulsando `CTRL + D`. Vease en este ejemplo

```
at 18:00 tomorrow

at> who  >> ~/usuarios.txt 2>> ~/usuarios.err
at> last >> ~/usuarios.txt 2>> ~/usuarios.err

Ctrl+D
```

También existe la posibilidad de escribir una tarea en una sola linea, sin el interprete, pero hay que tener cuidado con usar bien los comandos. Hay varias opciones para crear una tarea en una sola línea:

- <<< + " "

En el siguiente caso se utiliza para almacenar la dirección 

```
at now + 10min <<< "uptime > ~/carga.txt 2> carga.err"
```

- echo + |

```
echo "uptime > ~/carga.txt 2> carga.err" | at now + 10min
```

- En el caso de querer usar scripts, lo hacemos con -f

```
at next month + 1 day -f ~/scripts/copia_seguridad.sh >> ~/backup.txt 2>> ~/backup.err
```

- Ejemplo hecho en los ejercicios de clase

```bash
"Guardar en un fichero llamado "cargaNextMonday.txt" situado en el HOME la carga del sistema el próximo lunes a las 2:00 am"

at 2:00 next Monday <<< "uptime > ~/CargaNextMonday.txt"
```


Otras opciones utiles con at son:

- `atq` o `at -l`: Lista todas tareas programadas
- `at -c (id de la tarea)`: Mostrar los detalles de la tarea con ID especificado
- `atrm X (id de la tarea)`: Borra la tarea especificada

Podremos descubir más de at con el comando `man at`


### Tareas por tiempo (repetitivas)

En este caso, usaremos el programa crontab. Este es un poco más extenso que at, y se utiliza de la siguien manera: debemos colocar `crontab -e`. Esto nos abre un pequeño editor de texto (como Vi o Nano). Dentro de el tendremos un menú como este:

![alt text](image.png)

Al final del documento podemos observar una siglas. Estos seran los datos que debemos indicarle a crontab para que ejecute el comando cuando queramos: 

![alt text](image-1.png)

- `m`: minutos (de 0 a 59)
- `h`: horas (de 0 a 23)
- `dom`: día del mes (del 1 al 31, dependiendo del mes)
- `mon`: mes (de 1 a 12)
- `dow`: día de la semana (0: domingo, 1: lunes, 2: martes, 3: miercoles, 4: jueves, 5: viernes, 6: sábado) 
- `command`: comando o script a ejecutar

Dentro de estos parametros, entraran unos valores los cuales pueden ser indicados de las siguientes formas:

- `*`: Cualquier valor 
- `-`: Para indicar rangos. Ej: 4-8 (entre 4 y 8, incluyendolos)
- `,`: Para indicar Listas. Ej: 1,2,3
- `/`: Para indicar Intervalors. Ej: */5 (cada cinco veces --> 0,5,10...)
- Se pueden hacer combinaciones de lo simbolos anteriormente nombrados. Ej: 6-12/2 (l rango entre 6 y 12 de 2 en 2)


- Ejemplos hechos en clase

```bash
"Borrar todos los ficheros más antiguos de 30 días a las 3 de la mañana todos los días 10, 20 y 30 de cada mes"
# m h  dom      mon dow   command
  0 3  10,20,30 *   *     find / -type f -atime +30 --exec rm {} \;


"Guardar en un fichero llamado "carga30min.txt" situado en el HOME la carga del sistema cada 30 minutos de forma indefinida"
# m h  dom mon dow   command
  */30 *   *   * uptime >> ~/CargaCada30min.txt


"Usar un script para borrar ficheros temporales todos los días a las 12:15"
#m  h  dom mon dow  cmd
15  12  *   *   *   ~/borrar_temporales.sh >> ~/borrar_temporales.out 2>> ~/borrar_temporales.err

"Guardar la carga cada 20 minutos de 8:00 a 19:40 de lunes a viernes durante los días impares de la primera quincena de los meses de febrero mayo, junio y septiembre"
# m    h      dom     mon    dow  cmd
 */20  8-19  1-15/2  2,5,6,9  1-5  uptime >> ~/carga.txt
```


Aunque no se use tanto, tambien existe la posibilidad de indicarle a crontab, ciertos atajos tales como `@hourly`, `@daily`, `@weekly`, etc


- Operaciones utiles con contrab:
    - `crontab -l`: Listar tareas
    - `crontab -r`: Borrar todas las tareas

Comando Watch: El `watch` nos permite ver las salidas en pantalla de los comandos, con el tiempo determinado que hayamos programado para que se muestre. Ej: `watch -n 1 -d ps aux` (simular top ejecutando el comando ps cada segundo, mostrando las diferencias). Las opciones que ofrece este comando son:

- `n (segundo que se le indiquen)`: ejecuta el comando cada X segundos
- `n -d`: resalta las diferencias en la salida
- `n -p`: aumenta la precisión en el cálculo de los intervalos de tiempo




### Tareas por evento

- `batch`: Esta dentro de at y ejecuta tareas cuando la máquina tiene poca carga
- `incron`: Sirve para ejecutar una tarea cuando se borra, crea o cambia un archivo
- `@reboot`: Para tareas relacionadas con el arranque de la máquina


## MS Windows

En Windows se usa `schtasks` para todo tipo de tareas, veamos esta tarea por partes como ejemplo:

```
"Abrir la calculadora a las 20:38"

schtasks /create /sc once /st 20:38 /tn tarea1  /tr c:\Windows\System32\calc.exe
```

- `/create`: Crea la tarea
- `/sc (once: para tareas puntuales) (daily: para tareas diarias) (weekly: para tareas semanales) (monthly: para mensuales) (onstar: al iniciar el sistema), (onlogon: al abrir sesión), (onidle: cuando hay baja carga en el sisytema)`: Para indicar pla periocidad de la tarea
- `/st 20:38`: Indica la hora de inicio
- `/tn tarea1`: Indica nombre de la tarea
- `/tr c:\Windows\System32\calc.exe`: Indica la ruta de la aplicación a ejcutar

Para averiguar la ruta de alguna aplicación, podemos usar el comando where junto al nombre de la app. Ej: `where calc.exe --> c:\Windows\System32\calc.exe`



## Extras

### Comandos a usar para la seccion de comando en las tareas

Procesos del sistema
- `ps (aux , fea, -p, ...)`
- `pstree`
- `pidof`
- `pgrep`
- `top / htop (btop, ...)`
- `iotop`
- `uptime`
- `kill / pkill / killall / xkill (-l, -9, -15, ..., -INT, -KILL, -TERM, -STOP, -TSTP, -CONT, -USR1, -USR2,  ...)`
- `sleep`
- `trap 'comandos' SIGNALs`
- `nice`
- `renice`
- `nohup`
- `disown (-h, -a, -r)`

Procesos en primer plano (foreground) y segundo plano (background):
- `jobs (-l, ...)`
- `cmd &`
- `bg`
- `fg`
- `Ctrl+Z`

Usuarios / grupos
- `useradd (-m, -g, -G, -s, -d, -k, ...)`
- `usermod (-m, -g, -G, -aG, -l, -s, -d, -L, -U, ...)`
- `userdel (-r, -f, ...)`
- `passwd (-l, -u, -S, ...)`
- `adduser, deluser`
- `groupadd, groupmod, groupdel`
- `addgroup, delgroup`
- `getent (passwd, group, ...)`
- `id`
- `groups`
- `chown`
- `chgrp`
- `chfn`
- `chsh`
- `chage (-E, -M, -m, -I, -W, ...)`
- `chpasswd`
- `chgpasswd`
- `newgrp`
- `sudo`
- `su -`
- `w`
- `who`
- `users`
- `last`
- `pinky`
- `getfacl`
- `setfacl (-m u:user:perm, ...)`

### Tabla Resumen de tareas programas (Windows/Linux)

| Tipo                                   | GNU/Linux                       | MS Windows (cmd)                          |
|----------------------------------------|---------------------------------|-------------------------------------------|
| Por tiempo (tareas puntuales)          | at (-c, atq, atrm)              | schtasks (/sc ONCE)                       |
| Por tiempo (tareas repetitivas)        | crontab (-l, -e)<br>anacron, ...| schtasks (/sc HOURLY, DAILY, MONTHLY, etc.)|
| Por evento (baja carga)                | batch                           | schtasks (/sc ONIDLE)                     |
| Por evento (arranque)                  | crontab (@reboot)<br>update-rc.d  | schtasks (/sc ONSTART)                    |
| Por evento (logon, cualquier usuario)  |/etc/profile.d/                  | schtasks (/sc ONLOGON)<br>shell:common startup|
| Por evento (login, usuario concreto)  |$HOME/.profile<br>$HOME/.bashrc  | shell:startup                             |
| Por evento (cambio en directorios,<br>ficheros,...)| incron            |                                          |
| Por evento (otros eventos)             | Programación propia             | schtasks (/sc ONEVENT)                    |


