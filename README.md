# massive download App

Massive Download App

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Configuración del entorno de desarrollo

Flutter 3.22.0 (FVM configurado)

1. Ejecutar en la terminal (CMD)

```
dart pub global activate fvm
```
2. Ejecutar en la terminal (en la ruta del proyecto)

```
fvm use 3.22.0
```

## Primeros pasos

1. Copia el archivo env.example y pegalo en la misma ruta.
2. Renombra el archivo copiado como .env

### Ultimos pasos
Utiliza la consola para correr los siguientes comandos.

Limpiar los paquetes de flutter
```
flutter clean
```

Obtener  paquetes de flutter
```
flutter pub get
```

Generar archivo de traducciones
```
flutter gen-l10n
```

Archivos autogenerados para las rutas
```
dart run build_runner build --delete-conflicting-outputs
```

O para generarlos en tiempo real
```
dart run build_runner watch --delete-conflicting-outputs
```
flutter clean && dart run build_runner build --delete-conflicting-outputs && flutter pub get 

Compilar app en Android
```
flutter build apk --release
```