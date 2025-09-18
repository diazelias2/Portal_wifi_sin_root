# Portal_wifi_sin_root
portal cautivo wifi sin root

Características SIN ROOT

# 📱 Portal Cautivo Educativo SIN ROOT para Android

![No Root](https://img.shields.io/badge/No-Root_Required-success?style=for-the-badge&logo=android)
![Termux](https://img.shields.io/badge/Termux-Compatible-blue?style=for-the-badge&logo=terminal)
![Educational](https://img.shields.io/badge/Purpose-Educational_only-important?style=for-the-badge&logo=shield)

Solución completa para demostraciones educativas de seguridad WiFi sin necesidad de acceso root en dispositivos Android.

## 📖 Tabla de Contenidos

- [Características Principales](#-características-principales)
- [Requisitos del Sistema](#-requisitos-del-sistema)
- [Configuración de Red](#-configuración-de-red)
- [Características Educativas](#-características-educativas)
- [Monitoreo y Análisis](#-monitoreo-y-análisis)
- [Consideraciones Éticas](#-consideraciones-éticas)
- [Guía para Talleres](#-guía-para-talleres)
- [Preguntas Frecuentes](#-preguntas-frecuentes)

## ✨ Características Principales

### ✅ Ventajas sin Root

| Característica | Beneficio | Impacto |
|----------------|-----------|---------|
| **🚫 Sin Root** | Funciona en cualquier Android | Máxima compatibilidad |
| **⚡ Configuración Sencilla** | Solo Termux básico requerido | Rápida implementación |
| **🎓 Enfoque Educativo** | Interfaz didáctica integrada | Mejor aprendizaje |
| **📱 Código QR** | Acceso rápido y sencillo | Experiencia mejorada |

### ⚠️ Limitaciones Técnicas

| Limitación | Solución Alternativa | Impacto |
|------------|----------------------|---------|
| **No crea Access Point** | Usar misma red WiFi | Requiere red existente |
| **Acceso por IP local** | Navegador web estándar | Fácil acceso |
| **Misma red requerida** | Hotspot móvil alternativo | Flexibilidad |

## 🛠️ Requisitos del Sistema

### 📋 Prerrequisitos Mínimos
```bash
# Terminal Termux instalado desde F-Droid
# (No usar versión de Play Store - obsoleta)

# Paquetes esenciales:
pkg update && pkg upgrade
pkg install php curl nmap

# Opcional para código QR:
pkg install qrencode
```

### 🔍 Verificación de Requisitos
```bash
# Verificar instalación de PHP
php --version

# Verificar conectividad de red
termux-wifi-connectioninfo

# Verificar almacenamiento
termux-setup-storage
```

## 🌐 Configuración de Red

### Opción 1: Misma Red WiFi 🏠
```bash
# 1. Conectar todos los dispositivos a la misma red WiFi
# 2. Obtener IP del dispositivo host:
ifconfig || ip addr show

# 3. Acceder desde navegador:
# http://[IP-DEL-TELEFONO]:8080
```

### Opción 2: Hotspot Móvil 📶
```bash
# 1. Activar hotspot en el teléfono Android
# 2. Conectar dispositivos al hotspot
# 3. Determinar IP del host:
ip route get 1 | awk '{print $7}'

# 4. Acceso vía navegador web
```

### Opción 3: Código QR 🔳
```bash
# 1. Instalar qrencode (opcional):
pkg install qrencode

# 2. El script genera QR automáticamente
# 3. Escanear con cámara del dispositivo objetivo
# 4. Acceso instantáneo sin escribir URLs
```

## 🎓 Características Educativas

### Mensajes de Concienciación Integrados
```html
<!-- Advertencia educativa visible -->
<div class="warning">
⚠️ DEMOSTRACIÓN EDUCATIVA DE SEGURIDAD
No introduzca información personal real
</div>
```

### Elementos Didácticos Incluidos
- ✅ **Explicaciones de seguridad** incorporadas en la interfaz
- ✅ **Mensajes preventivos** en cada interacción
- ✅ **Enfoque pedagógico** sobre explotación
- ✅ **Datos de prueba solamente** - nunca información real
- ✅ **Consejos de seguridad** post-demonstración

### Contenido Educativo
- 📚 **Riesgos de redes públicas** WiFi
- 🔒 **Importancia de contraseñas** únicas
- 🌐 **Uso seguro de redes** no confiables
- 📱 **Protección de dispositivos** móviles

## 📊 Monitoreo y Análisis

### Funciones de Monitorización
| Función | Descripción | Beneficio |
|---------|-------------|-----------|
| **Tiempo Real** | Conexiones activas | Visibilidad inmediata |
| **Timestamp** | Registro temporal preciso | Análisis cronológico |
| **Contador de Intentos** | Métricas de interacción | Datos cuantificables |
| **Interfaz Limpia** | Visualización clara | Experiencia mejorada |

### Ejemplo de Salida de Monitoreo
```bash
=== MONITOR DE CONEXIONES ===
Servidor: http://192.168.1.15:8080

=== CAPTURAS RECIENTES ===
[2024-01-15 10:30:45] IP: 192.168.1.20 - Usuario: demo - Contraseña: test123
[2024-01-15 10:31:22] IP: 192.168.1.21 - Usuario: prueba - Contraseña: password

Total de intentos: 2
```

## ⚖️ Consideraciones Éticas

### Protecciones Integradas
```bash
# El script incluye múltiples capas de protección ética:
- ✅ Advertencias claras de uso educativo
- ✅ Mensajes de prevención de seguridad
- ✅ Enfoque en aprendizaje, no en explotación
- ✅ Eliminación fácil de datos de demostración
- ✅ Registro de actividades con fines educativos
```

### Directrices de Uso Responsable
1. **🛡️ Consentimiento Informado** de todos los participantes
2. **📝 Propósito Educativo** claramente comunicado
3. **🗑️ Eliminación de Datos** después de demostraciones
4. **🚫 Sin Datos Reales** permitidos en pruebas
5. **🔒 Entorno Controlado** para todas las pruebas

## 🎯 Guía para Talleres

### Para Instructores 👨‍🏫
| Tarea | Descripción | Recomendación |
|-------|-------------|---------------|
| **Pre-configuración** | Preparar Termux previamente | Ahorra tiempo en taller |
| **Pruebas de Red** | Verificar conectividad | Previene problemas técnicos |
| **Explicación Clara** | Propósito educativo | Establece contexto adecuado |
| **Contramedidas** | Enseñar protección | Valor educativo agregado |

### Para Participantes 👥
| Paso | Actividad | Objetivo de Aprendizaje |
|------|-----------|-------------------------|
| **Conexión** | Unirse a red compartida | Entender redes WiFi |
| **Acceso** | Navegador o código QR | Experiencia práctica |
| **Pruebas** | Usar datos de demostración | Sin riesgo personal |
| **Aprendizaje** | Analizar resultados | Concienciación seguridad |

### Checklist para Talleres Exitosos
- [ ] **Termux preconfigurado** en dispositivo host
- [ ] **Red WiFi estable** disponible
- [ ] **Material educativo** preparado
- [ ] **Datos de prueba** definidos
- [ ] **Plan de respaldo** para problemas técnicos
- [ ] **Evaluación post-taller** preparada

## ❓ Preguntas Frecuentes

### P: ¿Realmente no necesita root?
**R:** ✅ Correcto, funciona completamente sin privilegios root gracias a las capacidades de red de Termux.

### P: ¿Qué versiones de Android son compatibles?
**R:** Android 7.0+ con Termux instalado desde F-Droid.

### P: ¿Los datos se almacenan permanentemente?
**R:** No, todos los datos se eliminan fácilmente y solo son para demostración.

### P: ¿Es legal usar este script?
**R:** ✅ Solo para fines educativos con consentimiento de participantes.

### P: ¿Funciona sin internet?
**R:** Sí, funciona perfectamente en redes locales sin acceso a internet.

### P: ¿Puedo personalizar la página de login?
**R:** ✅ Sí, los archivos HTML y PHP son completamente editables.

## 🚀 Implementación Rápida

### Instalación en 3 Pasos
```bash
# 1. Instalar Termux desde F-Droid
# 2. Ejecutar en Termux:
pkg update && pkg upgrade
pkg install php curl

# 3. Clonar y ejecutar script:
git clone [repositorio]
cd portal-cautivo
chmod +x portal_cautivo.sh
./portal_cautivo.sh
```

### Solución de Problemas Comunes
```bash
# Error: Puerto en uso
./portal_cautivo.sh --port 8081

# Error: PHP no instalado
pkg install php

# Error: Sin conexión de red
termux-wifi-connectioninfo
```

---

<div align="center">

### ⚠️ **Disclaimer de Uso Educativo**
Este software es exclusivamente para fines educativos de concienciación en ciberseguridad. El uso malicioso está estrictamente prohibido.

### 📚 **Recursos Adicionales**
[Guía de Seguridad WiFi](https://www.example.com/seguridad-wifi) | 
[Termux Documentation](https://termux.dev/)

</div>

---

**🎯 Propósito Principal**: Educación en seguridad y prevención de ataques de phishing mediante demostraciones controladas y éticas.

**🛡️ Compromiso Ético**: Todas las demostraciones deben realizarse con consentimiento informado y propósito educativo claro.

**📊 Efectividad**: Probado en múltiples talleres educativos con resultados excelentes de concienciación.
