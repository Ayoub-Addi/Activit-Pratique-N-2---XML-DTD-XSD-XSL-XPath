<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
        <body>
            <table border="1" width="100%">
                <tr>
                    <th>Num</th>
                    <th>Date</th>
                    <th>Exp</th>
                    <th>Dest</th>
                    <th>Etat</th>
                    <th>Montant</th>
                </tr>
                <xsl:for-each select="rapport/mandat">
                    <tr>
                        <td><xsl:value-of select="position()"/></td>
                        <td><xsl:value-of select="@date"/></td>
                        <td>
                            <ul>
                                <li>CIN:<xsl:value-of select="expediteur/@cin"/></li>
                                <li>Nom:<xsl:value-of select="expediteur/@nom"/></li>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <li>CIN:<xsl:value-of select="destinataire/@cin"/></li>
                                <li>Nom:<xsl:value-of select="destinataire/@nom"/></li>
                            </ul>
                        </td>
                        <td><xsl:value-of select="@etat"/></td>
                        <td><xsl:value-of select="@montant"/></td>
                    </tr>
                </xsl:for-each>
                <tr>
                    <td colspan="5">Total des mandats</td>
                    <td><xsl:value-of select="sum(//mandat/@montant)"/></td>
                </tr>
                <tr>
                    <td colspan="5">Total des mandats reçus</td>
                    <td><xsl:value-of select="sum(//mandat[@etat='reçu']/@montant)"/></td>
                </tr>
                <tr>
                    <td colspan="5">Total des mandats non reçus</td>
                    <td><xsl:value-of select="sum(//mandat[@etat='non_reçu']/@montant)"/></td>
                </tr>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
