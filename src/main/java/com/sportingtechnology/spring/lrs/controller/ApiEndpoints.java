package com.sportingtechnology.spring.lrs.controller;

public class ApiEndpoints {
    public static final String API_PATH = "/v1/";
    // Xapi services
	public static final String STATEMENTS_ENDPOINT = "/statements";
    public static final String AGENTS_ENDPOINT = "/agents";
    public static final String AGENTS_PROFILE_ENDPOINT = "/agents/profile";
    public static final String ACTIVITIES_ENDPOINT = "/activities";
    public static final String ACTIVITIES_PROFILE_ENDPOINT = "/activities/profile";
    public static final String ACTIVITIES_STATE_ENDPOINT = "/activities/state";
    public static final String ABOUT_ENDPOINT = "/about";

    // Spring Boot Actuator services
    public static final String AUTOCONFIG_ENDPOINT = "/autoconfig";
    public static final String BEANS_ENDPOINT = "/beans";
    public static final String CONFIGPROPS_ENDPOINT = "/configprops";
    public static final String ENV_ENDPOINT = "/env";
    public static final String MAPPINGS_ENDPOINT = "/mappings";
    public static final String METRICS_ENDPOINT = "/metrics";
    public static final String SHUTDOWN_ENDPOINT = "/shutdown";
}
