@if "%DEBUG%" == "" @echo off
@rem ###############################################################################
@rem #
@rem  Gradle startup script for Windows
@rem #
@rem ###############################################################################

set DIR=%~dp0
set APP_HOME=%DIR%

set CLASSPATH=%APP_HOME%gradle\wrapper\gradle-wrapper.jar

if "%JAVA_HOME%" == "" (
    set _JAVA=java
) else (
    set _JAVA=%JAVA_HOME%\bin\java
)

"%_JAVA%" -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*
