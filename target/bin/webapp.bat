@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2004 The Apache Software Foundation.
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM      http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------
@REM

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.0.28\tomcat-embed-core-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-logging-juli\8.0.28\tomcat-embed-logging-juli-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\8.0.28\tomcat-embed-jasper-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.0.28\tomcat-embed-el-8.0.28.jar;"%REPO%"\org\eclipse\jdt\core\compiler\ecj\4.4.2\ecj-4.4.2.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\8.0.28\tomcat-jasper-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-servlet-api\8.0.28\tomcat-servlet-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\8.0.28\tomcat-juli-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\8.0.28\tomcat-el-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-api\8.0.28\tomcat-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-util-scan\8.0.28\tomcat-util-scan-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-util\8.0.28\tomcat-util-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\8.0.28\tomcat-jasper-el-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\8.0.28\tomcat-jsp-api-8.0.28.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-web\1.3.1.RELEASE\spring-boot-starter-web-1.3.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter\1.3.1.RELEASE\spring-boot-starter-1.3.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot\1.3.1.RELEASE\spring-boot-1.3.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-autoconfigure\1.3.1.RELEASE\spring-boot-autoconfigure-1.3.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-logging\1.3.1.RELEASE\spring-boot-starter-logging-1.3.1.RELEASE.jar;"%REPO%"\ch\qos\logback\logback-classic\1.1.3\logback-classic-1.1.3.jar;"%REPO%"\ch\qos\logback\logback-core\1.1.3\logback-core-1.1.3.jar;"%REPO%"\org\slf4j\jul-to-slf4j\1.7.13\jul-to-slf4j-1.7.13.jar;"%REPO%"\org\slf4j\log4j-over-slf4j\1.7.13\log4j-over-slf4j-1.7.13.jar;"%REPO%"\org\springframework\spring-core\4.2.4.RELEASE\spring-core-4.2.4.RELEASE.jar;"%REPO%"\org\yaml\snakeyaml\1.16\snakeyaml-1.16.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-tomcat\1.3.1.RELEASE\spring-boot-starter-tomcat-1.3.1.RELEASE.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-websocket\8.0.28\tomcat-embed-websocket-8.0.28.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-validation\1.3.1.RELEASE\spring-boot-starter-validation-1.3.1.RELEASE.jar;"%REPO%"\org\hibernate\hibernate-validator\5.2.2.Final\hibernate-validator-5.2.2.Final.jar;"%REPO%"\javax\validation\validation-api\1.1.0.Final\validation-api-1.1.0.Final.jar;"%REPO%"\com\fasterxml\classmate\1.1.0\classmate-1.1.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.6.4\jackson-databind-2.6.4.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.6.4\jackson-core-2.6.4.jar;"%REPO%"\org\springframework\spring-web\4.2.4.RELEASE\spring-web-4.2.4.RELEASE.jar;"%REPO%"\org\springframework\spring-aop\4.2.4.RELEASE\spring-aop-4.2.4.RELEASE.jar;"%REPO%"\aopalliance\aopalliance\1.0\aopalliance-1.0.jar;"%REPO%"\org\springframework\spring-beans\4.2.4.RELEASE\spring-beans-4.2.4.RELEASE.jar;"%REPO%"\org\springframework\spring-context\4.2.4.RELEASE\spring-context-4.2.4.RELEASE.jar;"%REPO%"\org\springframework\spring-webmvc\4.2.4.RELEASE\spring-webmvc-4.2.4.RELEASE.jar;"%REPO%"\org\springframework\spring-expression\4.2.4.RELEASE\spring-expression-4.2.4.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-data-rest\1.3.1.RELEASE\spring-boot-starter-data-rest-1.3.1.RELEASE.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.6.4\jackson-annotations-2.6.4.jar;"%REPO%"\org\springframework\data\spring-data-rest-webmvc\2.4.2.RELEASE\spring-data-rest-webmvc-2.4.2.RELEASE.jar;"%REPO%"\org\springframework\data\spring-data-rest-core\2.4.2.RELEASE\spring-data-rest-core-2.4.2.RELEASE.jar;"%REPO%"\org\springframework\hateoas\spring-hateoas\0.19.0.RELEASE\spring-hateoas-0.19.0.RELEASE.jar;"%REPO%"\org\springframework\plugin\spring-plugin-core\1.2.0.RELEASE\spring-plugin-core-1.2.0.RELEASE.jar;"%REPO%"\org\atteo\evo-inflector\1.2.1\evo-inflector-1.2.1.jar;"%REPO%"\com\github\fge\json-patch\1.7\json-patch-1.7.jar;"%REPO%"\com\github\fge\jackson-coreutils\1.6\jackson-coreutils-1.6.jar;"%REPO%"\com\github\fge\msg-simple\1.1\msg-simple-1.1.jar;"%REPO%"\com\github\fge\btf\1.2\btf-1.2.jar;"%REPO%"\com\google\guava\guava\16.0.1\guava-16.0.1.jar;"%REPO%"\com\google\code\findbugs\jsr305\2.0.1\jsr305-2.0.1.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.13\slf4j-api-1.7.13.jar;"%REPO%"\org\slf4j\jcl-over-slf4j\1.7.13\jcl-over-slf4j-1.7.13.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-data-jpa\1.3.1.RELEASE\spring-boot-starter-data-jpa-1.3.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-aop\1.3.1.RELEASE\spring-boot-starter-aop-1.3.1.RELEASE.jar;"%REPO%"\org\aspectj\aspectjweaver\1.8.7\aspectjweaver-1.8.7.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-jdbc\1.3.1.RELEASE\spring-boot-starter-jdbc-1.3.1.RELEASE.jar;"%REPO%"\org\apache\tomcat\tomcat-jdbc\8.0.28\tomcat-jdbc-8.0.28.jar;"%REPO%"\org\springframework\spring-jdbc\4.2.4.RELEASE\spring-jdbc-4.2.4.RELEASE.jar;"%REPO%"\org\hibernate\hibernate-entitymanager\4.3.11.Final\hibernate-entitymanager-4.3.11.Final.jar;"%REPO%"\org\jboss\logging\jboss-logging\3.3.0.Final\jboss-logging-3.3.0.Final.jar;"%REPO%"\org\jboss\logging\jboss-logging-annotations\1.2.0.Beta1\jboss-logging-annotations-1.2.0.Beta1.jar;"%REPO%"\org\hibernate\hibernate-core\4.3.11.Final\hibernate-core-4.3.11.Final.jar;"%REPO%"\antlr\antlr\2.7.7\antlr-2.7.7.jar;"%REPO%"\org\jboss\jandex\1.1.0.Final\jandex-1.1.0.Final.jar;"%REPO%"\dom4j\dom4j\1.6.1\dom4j-1.6.1.jar;"%REPO%"\xml-apis\xml-apis\1.0.b2\xml-apis-1.0.b2.jar;"%REPO%"\org\hibernate\common\hibernate-commons-annotations\4.0.5.Final\hibernate-commons-annotations-4.0.5.Final.jar;"%REPO%"\org\hibernate\javax\persistence\hibernate-jpa-2.1-api\1.0.0.Final\hibernate-jpa-2.1-api-1.0.0.Final.jar;"%REPO%"\org\javassist\javassist\3.18.1-GA\javassist-3.18.1-GA.jar;"%REPO%"\javax\transaction\javax.transaction-api\1.2\javax.transaction-api-1.2.jar;"%REPO%"\org\springframework\data\spring-data-jpa\1.9.2.RELEASE\spring-data-jpa-1.9.2.RELEASE.jar;"%REPO%"\org\springframework\data\spring-data-commons\1.11.2.RELEASE\spring-data-commons-1.11.2.RELEASE.jar;"%REPO%"\org\springframework\spring-orm\4.2.4.RELEASE\spring-orm-4.2.4.RELEASE.jar;"%REPO%"\org\springframework\spring-tx\4.2.4.RELEASE\spring-tx-4.2.4.RELEASE.jar;"%REPO%"\org\springframework\spring-aspects\4.2.4.RELEASE\spring-aspects-4.2.4.RELEASE.jar;"%REPO%"\org\postgresql\postgresql\9.4.1211\postgresql-9.4.1211.jar;"%REPO%"\com\heroku\sample\embeddedTomcatSample\1.0-SNAPSHOT\embeddedTomcatSample-1.0-SNAPSHOT.jar
set EXTRA_JVM_ARGUMENTS=
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" launch.Main %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
