# Proyecto Sejmet

El siguiente proyecto, es una prueba conceptual para una solución que hará uso de un proveedor de servicios en la nube, con el fin de ofrecer a sus clientes una alternativa de gestión y manejo de stock de productos comercializados en farmacias.

### Instrucciones

#### Requisitos previos
- **.NET 7 SDK** *puede descargarse [aqui](https://dotnet.microsoft.com/en-us/download/dotnet/7.0)*
- **MS SQL Server** *instalado localmente o en un contenedor de Docker*
- **VS 2022 o VS Code**

1. Clonar el repo, y abrir la solución con VS 2022
2.	Hacer clic derecho en la solución Sejmet.Database y seleccionar la opción Comparar Esquema (Schema Compare)
3.	Apuntar como objetivo al motor de base de datos que tenga instalado y actualizar la base de datos con el esquema
4.	Ejecutar del script contenido en la carpeta Scripts del mismo proyecto, desde la línea 330 hasta la línea 87361
5.	En caso de no contar con VS 2022, ejecutar todo el script contenido en dicha carpeta, el mismo creara la base de datos e insertara todos los registros necesarios
6.	Abrir una terminal de comandos, localizado donde se clono el proyecto
7.	Abrir el archivo Sejmet.API.csproj y eliminar la sección de `<UserSecretsID>`
8.	Ejecutar el siguiente comando: `dotnet user-secrets init` (Esto creara un nuevo User Secrets localmente)
9.	Ejecutar el siguiente comando: `dotnet user-secrets set ConnectionStrings:SejmetDB "Data Source={inserte aquí la ubicación de su base de datos};Initial Catalog=SejmetDB;Integrated Security=True;TrustServerCertificate=true"`
10.	Ejecutar el siguiente comando: `dotnet restore`
11.	Ejecutar el siguiente comando: `dotnet build`
12.	Ejecutar el siguiente comando: `dotnet run http` o `https`
13.	La aplicación debería estar corriendo en el puerto 5149