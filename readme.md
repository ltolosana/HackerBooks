#HackerBooks

Hola Fernando.
Junto con este fichero tienes la practica de Fundamentos iOS.
Me gustaria haber intentado la parte extra, pero al final no he podido.

En la practica hay bastante código que debería haber sacado a métodos de utilidad, pero en algunos casos no tenia muy claro como hacerlo. No me gusta mucho como ha quedado y se que se puede mejorar.

El diseño también es poco atractivo, pero preferia dedicar el tiempo a la funcionalidad.

También soy consciente de que he dejado mucho NSLOG. Esto, claro esta, se quitaria en una version totalmente funcional y productiva.

Bueno, vamos con la practica en si:


**Procesado del JSON**

-Ten en cuenta que dicho método devuelve un id que puede contener tanto un NSArray de NSDictionaries como un NSDictionary . Mira en la ayuda en método isKindOfClass: y como usarlo para saber qué te han devuelto exactamente. 

En la practica sabíamos que si o si vamos a tener un NSARRAY (si no vaya mierda de biblioteca), por lo que no considero necesario la consulta de si es un array o un diccionario.

-¿Qué otros métodos similares hay? ¿En qué se distingue isMemberOfClass: ? 

Como nos has dicho varias veces, en Cocoa hay muchos métodos de introspección. El mas parecido a isKindOfClass: es isMemberOfClass:
  
La diferencia entre isKindOfClass: e isMemberOfClass: es que el primero también tiene en cuenta las clases derivadas de la clase en cuestión.


**Especificaciones de HackerBooks**
**Modelo**

-Al arrancar la App por primera vez (esto lo averiguas con NSUserDefaults ), descarga el JSON (tienes la URL en la sección de recursos) como un NSData y guárdalo en la carpeta Documents de tu Sandbox. Para ello, usa el método dataWithContentsOfURL: de NSData . 
Haz lo mismo para las imágenes de portada y los pdfs. ¿Donde guardarías estos datos? 

Tanto el JSON como los pdfs los he guardado en documents, dado que son ficheros importantes y en el caso del pdf pesado y que no debería cambiar. Sin embargo las imágenes de portada las he guardado en caches, ya que no es algo importante y en un momento dado prescindible y que se puede recargar sin problemas. 

-Cambia las urls de remotas a locales, para que la próxima vez que se cargue la App, se pillen los datos locales. 

No he cambiado las urls como tal. De hecho las he dejado intactas por si se vacia la cache para poder descargar las imágenes de nuevo desde internet. Sin embargo, dando por hecho que el titulo de cada libro es único, he guardado cada imagen y pdf haciendo uso del titulo del libro.


**Tabla de Libros**
-¿Cómo harías eso? ¿Se te ocurre más de una forma de hacerlo? Explica la decisión de diseño que hayas tomado. 

Siguiendo con el mismo precepto anterior, de que el titulo es único, he decidido guardar en NSUSERDEFAULTS un NSARRAY de NSSTRING con los titulos de los libros favoritos. Cada vez que un libro actualiza su estado de favorito, se añade o quita de este array, actualizando la información de NSUSERDEFAULTS.
En principio me ha parecido lo menos costoso en cuanto a ocupación. Se me ocurrían otras dos opciones. 
La primera tratar Favorites como un tag mas. Pero se me planteaban dos problemas, el primero que habría que estar modificando el JSON constantemente. Ademas, una mejora de la App seria comprobar si nos pasan un JSON mas reciente con nuevos libros y esto seria un problema, puesto que podríamos perder los favoritos.
La segunda opción era crear un NSArray de libros, pero esto consume mas memoria. Y claro ese array habría que guardarlo de alguna forma para que persista, lo que seria generar un nuevo JSON o similar.
Lo que no tengo muy claro, es computacionalmente y de cara a la percepción del usuario que opción seria mas adecuada.

-Cuando cambia el valor de la propiedad isFavorite de un AGTBook, la tabla deberá 
reflejar ese hecho. ¿Cómo lo harías? Es decir, ¿cómo enviarías información de un AGTBook a un AGTLibraryTableViewController? ¿Se te ocurre más de una forma de hacerlo? ¿Cual te parece mejor? Explica tu elección. 

Cuando el libro cambia su estado de favorito, manda una notificación a quien le pueda interesar. La tabla recibe la notificación y se recarga, actualizando su vista y metiendo/sacando el libro de la sección de favoritos.
Siempre nos has dicho que el modelo avisa de sus cambios con notificaciones, así que si hay mas de una forma de hacerlo (los delegados serian una), la optima es la notificación.

-Nota: para que la tabla se actualice, usa el método reloadData de UITableView . Esto hace que la tabla vuelva a pedir datos a su dataSource. ¿Es esto una aberración desde el punto de rendimiento (volver a cargar datos que en su mayoría ya estaban correctos)? Explica por qué no es así. ¿Hay una forma alternativa? ¿Cuando crees que vale la pena usarlo? 

Se me ocurre que una forma de hacerlo seria tratar de forma manual únicamente la sección de favoritos, pero dado que en Cocoa las tablas usan un dataSource y te van pidiendo a ti los datos, no me parece una buena idea meter mano.


**Controlador de PDF:AGTSimplePDFViewController**

-Cuando el usuario cambia en la tabla el libro seleccionado, el AGTSimplePDFViewController debe de actualizarse. ¿Cómo lo harías? 

Esto se hace con una notificación. De todas formas he considerado que si el usuario cambia de libro mientras esta leyendo uno, en vez de actualizar el pdf, le mando a las vista de informacion del nuevo libro. Tal vez haya tocado por error y no quiero hacerle perder tiempo cargando un pdf que no quiere leer, o tal vez primero quiera ver los detalles del nuevo libro antes de ponerse a leerlo.
