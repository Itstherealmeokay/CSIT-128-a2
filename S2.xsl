<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Weather Forecast</title>
                <style>
                    table {
                        width: 50%;
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

                    /* Make Date column narrow */
                    th.date-col {
                        width: 50px; /* Adjust width of the Date column */
                    }

                    td.date-col {
                        width: 50px; /* Apply same width to corresponding td */
                    }

                    td {
                        height: 150px; /* Control height of cells */
                    }
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
                            <!-- Format the date as 'day month' and apply narrow column -->
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
                            
                            
                        </tr>
                    </xsl:for-each>
                    
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
