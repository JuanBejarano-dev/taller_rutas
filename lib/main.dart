import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Mi aplicación',

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,

        scaffoldBackgroundColor: const Color(0xFFF7F3FF),
      ),

      home: const Login(),
    );
  }
}

// 1. INICIAR SESIÓN

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final correo = TextEditingController();

    final clave = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [
              const Icon(
                Icons.lock_outline,
                size: 75,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 16),

              const Text(
                'Iniciar sesión',

                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text('Bienvenido de nuevo'),

              const SizedBox(height: 28),

              TextField(
                controller: correo,

                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',

                  border: OutlineInputBorder(),

                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),

              const SizedBox(height: 14),

              TextField(
                controller: clave,

                obscureText: true,

                decoration: const InputDecoration(
                  labelText: 'Contraseña',

                  border: OutlineInputBorder(),

                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,

                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,

                    MaterialPageRoute(builder: (_) => const Recuperar()),
                  ),

                  child: const Text('¿Olvidaste tu contraseña?'),
                ),
              ),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    if (correo.text.contains('@') && clave.text.isNotEmpty) {
                      Navigator.pushReplacement(
                        context,

                        MaterialPageRoute(builder: (_) => const Inicio()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Escribe un correo válido y una contraseña',
                          ),
                        ),
                      );
                    }
                  },

                  child: const Text('Ingresar'),
                ),
              ),

              const SizedBox(height: 12),

              TextButton(
                onPressed: () => Navigator.push(
                  context,

                  MaterialPageRoute(builder: (_) => const Registro()),
                ),

                child: const Text('¿No tienes cuenta? Regístrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. REGISTRO

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    final nombre = TextEditingController();

    final correo = TextEditingController();

    final clave = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Crear cuenta')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [
            const Icon(
              Icons.person_add_alt_1,
              size: 70,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 12),

            const Text(
              'Regístrate',

              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            TextField(
              controller: nombre,

              decoration: const InputDecoration(
                labelText: 'Nombre completo',

                border: OutlineInputBorder(),

                prefixIcon: Icon(Icons.person_outline),
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              controller: correo,

              keyboardType: TextInputType.emailAddress,

              decoration: const InputDecoration(
                labelText: 'Correo electrónico',

                border: OutlineInputBorder(),

                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              controller: clave,

              obscureText: true,

              decoration: const InputDecoration(
                labelText: 'Contraseña',

                border: OutlineInputBorder(),

                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  if (nombre.text.isNotEmpty &&
                      correo.text.contains('@') &&
                      clave.text.length >= 4) {
                    Navigator.pushReplacement(
                      context,

                      MaterialPageRoute(builder: (_) => const Inicio()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Completa los campos. La contraseña debe tener 4 caracteres o más',
                        ),
                      ),
                    );
                  }
                },

                child: const Text('Crear cuenta'),
              ),
            ),

            TextButton(
              onPressed: () => Navigator.pop(context),

              child: const Text('Ya tengo una cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. RECUPERAR CONTRASEÑA

class Recuperar extends StatelessWidget {
  const Recuperar({super.key});

  @override
  Widget build(BuildContext context) {
    final correo = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Recuperar contraseña')),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(
              Icons.email_outlined,
              size: 70,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 16),

            const Text(
              'Recupera tu cuenta',

              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              'Escribe tu correo para continuar.',

              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            TextField(
              controller: correo,

              keyboardType: TextInputType.emailAddress,

              decoration: const InputDecoration(
                labelText: 'Correo electrónico',

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  if (correo.text.contains('@')) {
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (_) => const Codigo()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Escribe un correo válido')),
                    );
                  }
                },

                child: const Text('Enviar código'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. CÓDIGO DE VERIFICACIÓN

class Codigo extends StatelessWidget {
  const Codigo({super.key});

  @override
  Widget build(BuildContext context) {
    final codigo = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Verificar código')),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(
              Icons.verified_user_outlined,

              size: 70,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 16),

            const Text(
              'Código de verificación',

              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),

              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text('Para probar la pantalla, escribe 1234.'),

            const SizedBox(height: 24),

            TextField(
              controller: codigo,

              keyboardType: TextInputType.number,

              maxLength: 4,

              textAlign: TextAlign.center,

              decoration: const InputDecoration(
                labelText: 'Código de 4 dígitos',

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  if (codigo.text == '1234') {
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (_) => const NuevaClave()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('El código de prueba es 1234'),
                      ),
                    );
                  }
                },

                child: const Text('Verificar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 5. NUEVA CONTRASEÑA

class NuevaClave extends StatelessWidget {
  const NuevaClave({super.key});

  @override
  Widget build(BuildContext context) {
    final clave = TextEditingController();

    final confirmar = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Nueva contraseña')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(Icons.lock_reset, size: 70, color: Colors.deepPurple),

            const SizedBox(height: 16),

            const Text(
              'Crea una nueva contraseña',

              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),

              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            TextField(
              controller: clave,

              obscureText: true,

              decoration: const InputDecoration(
                labelText: 'Nueva contraseña',

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              controller: confirmar,

              obscureText: true,

              decoration: const InputDecoration(
                labelText: 'Confirmar contraseña',

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  if (clave.text.length >= 4 && clave.text == confirmar.text) {
                    Navigator.pushAndRemoveUntil(
                      context,

                      MaterialPageRoute(builder: (_) => const Login()),

                      (route) => false,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Las contraseñas deben coincidir y tener 4 caracteres o más',
                        ),
                      ),
                    );
                  }
                },

                child: const Text('Guardar contraseña'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 6. PANTALLA PRINCIPAL

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),

        actions: [
          IconButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,

              MaterialPageRoute(builder: (_) => const Login()),

              (route) => false,
            ),

            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Icon(
                Icons.check_circle_outline,

                size: 90,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 18),

              const Text(
                '¡Bienvenido!',

                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                'Has ingresado correctamente.',

                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,

                  MaterialPageRoute(builder: (_) => const Login()),

                  (route) => false,
                ),

                child: const Text('Cerrar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
