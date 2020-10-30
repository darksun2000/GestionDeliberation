# GESTION DES DELIBERATIONS

Avans de commencer, voici un tutoriel pour utiliser [**git**](https://www.youtube.com/watch?v=HVsySz-h9r4) et [**github**](https://www.youtube.com/watch?v=hPfgekYUKgk): 

## Rappel sur les taches à faire
```
taches/
├── binome1 (Khalid et Boussif)
│   ├── La structure d'enseignement
│   ├── Les étudiants: inscription administrative
│   ├── Les étudiants: inscription en ligne
│   ├── Les étudiants: L'inscription pédagogique
│   └── L'etablissement et la filiere
├── binome2 (Yassine et Asmae)
│   ├──  Les utilisateurs (créaction, authentification et permissions): Les professeurs
│   ├── Les utilisateurs (création, authentification et permissions): Administrateur
│   └── Les utilisateurs (création, authentification et permissions): Le responsable de la filière
└── binome3 (Salah et Oussama)
    ├── Délibération annuelle
    ├── Délibération des modules de la session de rattrapage
    ├── Délibération des modules de la session ordinaire
    └── Délibération du semestre
```

## Proposition des frameworks

je propose d'utiliser les frameworks suivants:
* ``` spring ``` pour les implémentations rapides et faciles des controlleurs
* ``` hibernate ``` pour la transformation automatique des information de la base de données en **POJO** *(Plain Old Java Object)*, et inversement
* ``` maven ``` pour l'importation rapide et automatique des librairies que nous allons utiliser
* ``` kwonnam jsp ``` pour l'heritage des pages jsp *sans réecrire du code de multitudes de fois* ...

## Ce qu'il faut avoir

* une version **Java** supérieur à la **version 10** _(11 ou plus)_
* maven dans eclipse
* (privisoire) maven sur le système d'exploitation

## Pour tester le projet "Deliberation"

J'ai fais un petit projet se nommant "Deliberation", qui afficher "HELLO WORLD" lorsqu'on le lance. Vous pouvez le tester aussi, il faut:

* télecharger le dossier "Deliberation" qui se trouve dans ce repository
* deplacer le dossier vers vorte dossier de travail d'eclipse (généralement, c'est *eclipse-workspace* ).
* lancer eclipse
* appuiez sur **File > Open Projects from File System...**
* sur la fenetre qui s'ouvrira, appuiez sur le boutton **Directory...**
* selectionnez votre dossier de travail d'eclipse
* dans la liste d'enbas, chochez le dossier que vous avez deplacé avant (*Deliberation*)
* appuiez sur **Finish**

Maintenant que vous avez importé le projet:

* allez vers le projet Deliberation, puis **Java Resources > src/main/resources > application.properties**

Dans ce fichier, vous deviriez remplir les deux lignes suivantes

```
spring.datasource.username=
spring.datasource.password=
```

Le nom d'utilisateur et le mot de passe de votre serveur MySQL

* allez vers la classe __DeliberationApplication__ qui se trouve dans le paquet __com.umi__
* lancez l'application avec **Run As > Java Application**

Si vous voyez dans la consolle quelle que chose comme ça 

```

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.3.4.RELEASE)

2020-10-24 13:05:04.295  INFO 25315 --- [  restartedMain] com.umi.DeliberationApplication          : Starting DeliberationApplication on fukuro-hp with PID 25315 (/home/fukuro/eclipse-workspace-JEE/Deliberation/target/classes started by fukuro in /home/fukuro/eclipse-workspace-JEE/Deliberation)
2020-10-24 13:05:04.298  INFO 25315 --- [  restartedMain] com.umi.DeliberationApplication          : No active profile set, falling back to default profiles: default
2020-10-24 13:05:04.363  INFO 25315 --- [  restartedMain] .e.DevToolsPropertyDefaultsPostProcessor : Devtools property defaults active! Set 'spring.devtools.add-properties' to 'false' to disable
2020-10-24 13:05:04.363  INFO 25315 --- [  restartedMain] .e.DevToolsPropertyDefaultsPostProcessor : For additional web related logging consider setting the 'logging.level.web' property to 'DEBUG'
2020-10-24 13:05:05.112  INFO 25315 --- [  restartedMain] .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data JPA repositories in DEFERRED mode.
2020-10-24 13:05:05.135  INFO 25315 --- [  restartedMain] .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 14ms. Found 0 JPA repository interfaces.
2020-10-24 13:05:05.956  INFO 25315 --- [  restartedMain] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2020-10-24 13:05:05.968  INFO 25315 --- [  restartedMain] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2020-10-24 13:05:05.968  INFO 25315 --- [  restartedMain] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.38]
2020-10-24 13:05:06.367  INFO 25315 --- [  restartedMain] org.apache.jasper.servlet.TldScanner     : At least one JAR was scanned for TLDs yet contained no TLDs. Enable debug logging for this logger for a complete list of JARs that were scanned but no TLDs were found in them. Skipping unneeded JARs during scanning can improve startup time and JSP compilation time.
2020-10-24 13:05:06.375  INFO 25315 --- [  restartedMain] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2020-10-24 13:05:06.375  INFO 25315 --- [  restartedMain] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 2011 ms
2020-10-24 13:05:06.610  INFO 25315 --- [  restartedMain] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
2020-10-24 13:05:06.670  INFO 25315 --- [         task-1] o.hibernate.jpa.internal.util.LogHelper  : HHH000204: Processing PersistenceUnitInfo [name: default]
2020-10-24 13:05:06.701  WARN 25315 --- [  restartedMain] JpaBaseConfiguration$JpaWebConfiguration : spring.jpa.open-in-view is enabled by default. Therefore, database queries may be performed during view rendering. Explicitly configure spring.jpa.open-in-view to disable this warning
2020-10-24 13:05:06.751  INFO 25315 --- [         task-1] org.hibernate.Version                    : HHH000412: Hibernate ORM core version 5.4.21.Final
2020-10-24 13:05:06.928  INFO 25315 --- [         task-1] o.hibernate.annotations.common.Version   : HCANN000001: Hibernate Commons Annotations {5.0.1.Final}
2020-10-24 13:05:06.988  INFO 25315 --- [  restartedMain] o.s.b.a.w.s.WelcomePageHandlerMapping    : Adding welcome page template: index
2020-10-24 13:05:07.039  INFO 25315 --- [         task-1] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
2020-10-24 13:05:07.229  INFO 25315 --- [  restartedMain] .s.s.UserDetailsServiceAutoConfiguration : 

Using generated security password: 48781b29-c46f-4ca7-9f47-afa10694ddde

2020-10-24 13:05:07.294  INFO 25315 --- [         task-1] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
2020-10-24 13:05:07.310  INFO 25315 --- [         task-1] org.hibernate.dialect.Dialect            : HHH000400: Using dialect: org.hibernate.dialect.MySQL5Dialect
2020-10-24 13:05:07.354  INFO 25315 --- [  restartedMain] o.s.s.web.DefaultSecurityFilterChain     : Creating filter chain: any request, [org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter@66e4d430, org.springframework.security.web.context.SecurityContextPersistenceFilter@6de5a857, org.springframework.security.web.header.HeaderWriterFilter@7d3fe9d3, org.springframework.security.web.csrf.CsrfFilter@670dc63e, org.springframework.security.web.authentication.logout.LogoutFilter@5a2b20a4, org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter@257340c9, org.springframework.security.web.authentication.ui.DefaultLoginPageGeneratingFilter@5f53e2f5, org.springframework.security.web.authentication.ui.DefaultLogoutPageGeneratingFilter@3b5d809b, org.springframework.security.web.authentication.www.BasicAuthenticationFilter@5c4d7700, org.springframework.security.web.savedrequest.RequestCacheAwareFilter@57909598, org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter@6f566891, org.springframework.security.web.authentication.AnonymousAuthenticationFilter@265a9b0e, org.springframework.security.web.session.SessionManagementFilter@5e77ea81, org.springframework.security.web.access.ExceptionTranslationFilter@211680ce, org.springframework.security.web.access.intercept.FilterSecurityInterceptor@6e2583c3]
2020-10-24 13:05:07.401  INFO 25315 --- [  restartedMain] o.s.b.d.a.OptionalLiveReloadServer       : LiveReload server is running on port 35729
2020-10-24 13:05:07.466  INFO 25315 --- [  restartedMain] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
2020-10-24 13:05:07.469  INFO 25315 --- [  restartedMain] DeferredRepositoryInitializationListener : Triggering deferred initialization of Spring Data repositories…
2020-10-24 13:05:07.470  INFO 25315 --- [  restartedMain] DeferredRepositoryInitializationListener : Spring Data repositories initialized!
2020-10-24 13:05:07.481  INFO 25315 --- [  restartedMain] com.umi.DeliberationApplication          : Started DeliberationApplication in 3.573 seconds (JVM running for 4.27)
2020-10-24 13:05:07.542  INFO 25315 --- [         task-1] org.hibernate.search.engine.Version      : HSEARCH000034: Hibernate Search 5.8.0.Final
2020-10-24 13:05:07.585  INFO 25315 --- [         task-1] o.h.e.t.j.p.i.JtaPlatformInitiator       : HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
2020-10-24 13:05:07.666  INFO 25315 --- [         task-1] j.LocalContainerEntityManagerFactoryBean : Initialized JPA EntityManagerFactory for persistence unit 'default'

```

* dirigez-vous sur ``` localhos:8080 ```, puis vous trouvriez **HELLO WORLD** ecrit sur cette page


## Pour Windows

il vaut mieu avoir **Spring Tool Suites (STS)** installé sur votre IDE eclipse, pour se faire:
* Lancez eclipse
* Dans la bare de menu, dirigez vous sur Help > Eclipse Marketplace
* Attendez un moment le temps du chargement
* Sur la bare de texte **Find:** tapez ``` STS ```
* Vous allez trouver: ``` Spring Tool 3 (Standalone Edition) 3.9.13.RELEASE ```, sélectionez le
* appuiez sur **Finish**
* **Next > I accept conditions ...** ... vous connaissez la musique ``` ( ´･ω･)人(・ω・｀ ) ```
* Normalement eclipse redémarrera
* ouvrez le fichier ``` pom.xml ```
* recherchez la balise ``` dependency ``` qui contien **mysql**
* changez la version en ``` 5.1.46 ```
* Biensure, il ne faut pas oublier que vous devriez sensé avoir Java 11 ou plus:
	- allez vers la bare de menu et appuiez sur **Window > Preferences > Installed JREs**
	- vous allez trouvez si vous avez bien la librairie de ``` jdk 1.11.0 ``` ou plus

## Pour Hibernate

je vous conseil de regarder [**cette vidéo**](https://www.youtube.com/watch?v=VLlDaIcb3jE).
