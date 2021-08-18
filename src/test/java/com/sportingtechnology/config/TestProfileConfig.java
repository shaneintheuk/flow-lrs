package com.sportingtechnology.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.mock.jndi.SimpleNamingContextBuilder;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.annotation.PostConstruct;
import javax.ejb.SessionContext;
import javax.jms.ConnectionFactory;
import javax.jms.Queue;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import javax.transaction.UserTransaction;
import java.util.Objects;
import java.util.Properties;

import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@Configuration
@EnableJpaRepositories(basePackages = { "au.com.lavaconsulting.core", "uk.co.sportssoftware"  })
@ComponentScan(basePackages = { "au.com.lavaconsulting.core", "uk.co.sportssoftware", "com.sportingtechnology"  })
@PropertySource("classpath:persistence-generic-entity.properties")
@EnableTransactionManagement
@EnableWebMvc
@Profile("test")
public class TestProfileConfig {

    private Queue queue;
    private ConnectionFactory connectionFactory;

    @Autowired
    private Environment env;

    @Bean
    @Profile("test")
    public DataSource dataSource() {
        final DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(Objects.requireNonNull(env.getProperty("jdbc.driverClassName")));
        dataSource.setUrl(env.getProperty("jdbc.url"));
        dataSource.setUsername(env.getProperty("jdbc.username"));
        dataSource.setPassword(env.getProperty("jdbc.password"));

        return dataSource;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
        final LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
        em.setDataSource(dataSource());
        em.setPackagesToScan("au.com.lavaconsulting.core", "uk.co.sportssoftware");
        em.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        em.setJpaProperties(additionalProperties());
        return em;
    }

    @Bean
    JpaTransactionManager transactionManager(final EntityManagerFactory entityManagerFactory) {
        final JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(entityManagerFactory);
        return transactionManager;
    }

    final Properties additionalProperties() {
        final Properties hibernateProperties = new Properties();

        hibernateProperties.setProperty("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
        hibernateProperties.setProperty("hibernate.dialect", env.getProperty("spring.jpa.database-platform"));

        return hibernateProperties;
    }

    @Bean
    @Profile("test")
    public SessionContext ctx() {
        return mock(SessionContext.class);
    }

    @Bean
    @Profile("test")
    public UserTransaction userTransaction() {
        return mock(UserTransaction.class);
    }

    @PostConstruct
    public void setupJMS() throws NamingException {
        this.connectionFactory = mock(ConnectionFactory.class);
        this.queue = mock(Queue.class);

        SimpleNamingContextBuilder builder = new SimpleNamingContextBuilder();
        builder.bind("java:/jboss/exported/jms/queue/lavaAsyncEvents", queue);
        builder.bind("java:jboss/DefaultJMSConnectionFactory", connectionFactory);
        builder.activate();
    }

}
