package com.redhat.route;

import org.apache.camel.LoggingLevel;
import org.apache.camel.builder.RouteBuilder;

/*
 * This class is built for JBoss Fuse on Karaf
 */

public class SunsetRoute extends RouteBuilder {

    @Override
    public void configure() throws Exception {

        // Logs a string every 2000 milliseconds
        from("timer://myEapTimer?fixedRate=true&period=2000").log(LoggingLevel.INFO, "com.redhat.route", "THE SUN HAS SET").to(
            "log:SunsetLog?level=INFO");

    }

}
