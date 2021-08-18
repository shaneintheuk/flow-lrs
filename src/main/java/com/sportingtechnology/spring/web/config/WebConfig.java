package com.sportingtechnology.spring.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.data.web.config.EnableSpringDataWebSupport;
import org.springframework.hateoas.config.EnableHypermediaSupport;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@Configuration
/*@EnableJpaRepositories(basePackages = { "au.com.lavaconsulting.core", "uk.co.sportssoftware"  })
@ComponentScan(basePackages = { "au.com.lavaconsulting.core", "uk.co.sportssoftware", "com.sportingtechnology"  })
@PropertySource("classpath:persistence-entity.properties")*/
@EnableSpringDataWebSupport
@EnableHypermediaSupport(type = EnableHypermediaSupport.HypermediaType.HAL)
public class WebConfig implements WebMvcConfigurer {
    private Environment env;

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedMethods("GET", "PUT", "POST", "DELETE", "OPTIONS");
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(20 * 1024L * 1024L); // 20 meg
        return multipartResolver;
    }

    /*@Bean
    public RequestContextListener requestContextListener(){
        return new RequestContextListener();
    }

    @Bean
    public EntityManagerFactory entityManagerFactory() throws NamingException {
        final EntityManager em = (EntityManager) new JndiTemplate().lookup(env.getProperty("jdbc.url"));
        em.setProperty("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
        em.setProperty("hibernate.dialect", env.getProperty("spring.jpa.database-platform"));
        return em.getEntityManagerFactory();
    }

    @Bean
    JpaTransactionManager transactionManager(final EntityManagerFactory entityManagerFactory) {
        final JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(entityManagerFactory);
        return transactionManager;
    }

    public Environment getEnv() {
        return env;
    }

    @Bean(name = "transactionManager")
    public PlatformTransactionManager transactionManager() throws NamingException {
        JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(entityManagerFactory());
        return transactionManager;
    }

    @Autowired
    public void setEnv(Environment env) {
        this.env = env;
    }*/
}
