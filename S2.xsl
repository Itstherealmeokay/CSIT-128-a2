<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Weather Forecast</title>
                <style>
                    table {
                        width: 70%;
                        border-collapse: collapse;
                    }
                    table, th, td {
                        border: 1px solid black;
                        padding: 8px;
                    }
                    th {
                        background-color: aqua;
                        width: 100px;
                    }
                    th, td {
                        text-align: center;
                    }

                    th.date-col, td.date-col {
                        width: 60px;
                        background-color: aqua;
                    }

                    td {
                        height: 150px;
                        vertical-align: top;
                    }

                    img {
                        width: 100px;
                        height: 80px;
                    }

                    .sunny { color: orange; }
                    .cloudy { color: gray; }
                    .rain { color: blue; }
                    .thunderstorm { color: purple; }
                    .partlySunny { color: gold; }
                    .default { color: black; }
                </style>
            </head>
            <body>
                <h1><xsl:value-of select="forecast/@queryLocation"/> [<xsl:value-of select="forecast/@queryTime"/>]</h1>
                <table>
                    <tr>
                        <th class="date-col">Date</th>
                        <th>Monday</th>
                        <th>Tuesday</th>
                        <th>Wednesday</th>
                        <th>Thursday</th>
                        <th>Friday</th>
                        <th>Saturday</th>
                        <th>Sunday</th>
                    </tr>
                    
                    <xsl:for-each select="forecast/weather">
                        <tr>
                            <!-- Date column -->
                            <td class="date-col">
                                <xsl:value-of select="date"/> 
                                <xsl:text> </xsl:text>
                                <xsl:choose>
                                    <xsl:when test="month = '1'">Jan</xsl:when>
                                    <xsl:when test="month = '2'">Feb</xsl:when>
                                    <xsl:when test="month = '3'">Mar</xsl:when>
                                    <xsl:when test="month = '4'">Apr</xsl:when>
                                    <xsl:when test="month = '5'">May</xsl:when>
                                    <xsl:when test="month = '6'">Jun</xsl:when>
                                    <xsl:when test="month = '7'">Jul</xsl:when>
                                    <xsl:when test="month = '8'">Aug</xsl:when>
                                    <xsl:when test="month = '9'">Sep</xsl:when>
                                    <xsl:when test="month = '10'">Oct</xsl:when>
                                    <xsl:when test="month = '11'">Nov</xsl:when>
                                    <xsl:when test="month = '12'">Dec</xsl:when>
                                </xsl:choose>
                            </td>

                            <!-- Display weather details based on dayOfWeek -->
                            <xsl:choose>
                                <xsl:when test="dayOfWeek = 'Mon'">
                                    <td><xsl:call-template name="weatherCell"/></td><td/><td/><td/><td/><td/><td/>
                                </xsl:when>
                                <xsl:when test="dayOfWeek = 'Tues'">
                                    <td/><td><xsl:call-template name="weatherCell"/></td><td/><td/><td/><td/><td/>
                                </xsl:when>
                                <xsl:when test="dayOfWeek = 'Wed'">
                                    <td/><td/><td><xsl:call-template name="weatherCell"/></td><td/><td/><td/><td/>
                                </xsl:when>
                                <xsl:when test="dayOfWeek = 'Thu'">
                                    <td/><td/><td/><td><xsl:call-template name="weatherCell"/></td><td/><td/><td/>
                                </xsl:when>
                                <xsl:when test="dayOfWeek = 'Fri'">
                                    <td/><td/><td/><td/><td><xsl:call-template name="weatherCell"/></td><td/><td/>
                                </xsl:when>
                                <xsl:when test="dayOfWeek = 'Sat'">
                                    <td/><td/><td/><td/><td/><td><xsl:call-template name="weatherCell"/></td><td/>
                                </xsl:when>
                                <xsl:when test="dayOfWeek = 'Sun'">
                                    <td/><td/><td/><td/><td/><td/><td><xsl:call-template name="weatherCell"/></td>
                                </xsl:when>
                            </xsl:choose>
                        </tr>
                    </xsl:for-each>
                    
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- Template for displaying a weather cell -->
    <xsl:template name="weatherCell">
        <xsl:value-of select="concat(lowest, ' - ', highest)"/>
        <br/>
        <xsl:call-template name="overallImage"/>
        <br/>
        <span class="{overallCode}">
            <xsl:value-of select="overall"/>
        </span>
    </xsl:template>

    <!-- Template for displaying the weather icon -->
    <xsl:template name="overallImage">
        <xsl:choose>
            <xsl:when test="overallCode = 'sunny'">
                <img src="sunny.jpeg" alt="Sunny"/>
            </xsl:when>
            <xsl:when test="overallCode = 'cloudy'">
                <img src="cloudy.jpeg" alt="Cloudy"/>
            </xsl:when>
            <xsl:when test="overallCode = 'rain'">
                <img src="rain.jpeg" alt="Rain"/>
            </xsl:when>
            <xsl:when test="overallCode = 'thunderstorm'">
                <img src="thunderstorm.jpeg" alt="Thunderstorm"/>
            </xsl:when>
            <xsl:when test="overallCode = 'partlySunny'">
                <img src="partlySunny.jpeg" alt="Partly Sunny"/>
            </xsl:when>
            <xsl:otherwise>
                <img src="default.jpeg" alt="Weather"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
