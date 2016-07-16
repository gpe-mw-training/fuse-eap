package com.redhat.route;

import org.apache.camel.LoggingLevel;
import org.apache.camel.builder.RouteBuilder;

/*
 * This class is built for JBoss Fuse on Karaf
 */

public class SunriseRoute extends RouteBuilder {

    @Override
    public void configure() throws Exception {

        // Logs Hello World every 2000 milliseconds
        from("timer://myEapTimer?fixedRate=true&period=2000")
            .log(LoggingLevel.INFO, "com.redhat.route", "THE SUN HAS RISEN")
            .to("log:SunriseLog?level=INFO");

    }

}
