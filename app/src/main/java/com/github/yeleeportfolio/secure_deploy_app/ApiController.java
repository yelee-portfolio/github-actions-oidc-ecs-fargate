package com.github.yeleeportfolio.secure_deploy_app;

import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.health.contributor.Health;
import org.springframework.boot.health.contributor.HealthIndicator;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController implements HealthIndicator {

    @Value("${APP_VERSION:local}")
    private String appVersion;

    @Value("${DEMO_SECRET:}")
    private String demoSecret;

    @Value("${FAIL_HEALTHCHECK:false}")
    private boolean failHealthcheck;

    @GetMapping("/version")
    public Map<String, String> version() {
        return Map.of("version", appVersion);
    }

    @GetMapping("/env-check")
    public Map<String, Boolean> envCheck() {
        return Map.of("secretConfigured", !demoSecret.isBlank());
    }

    @Override
    public Health health() {
        if (failHealthcheck) {
            return Health.down()
                    .withDetail("reason", "Intentional failure test")
                    .build();
        }

        return Health.up().build();
    }
}