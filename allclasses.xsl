<?xml version="1.0"?>

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ns="http://www.arondor.com/xml/doccument"
	xmlns:str="http://exslt.org/strings">

	<xsl:variable name="urlprefix" select="'tempFiles/'"/>

	<xsl:template match="/com.arondor.common.reflection.catalog.SimpleAccessibleClassCatalog">
		<xsl:apply-templates select="accessibleClassMap/entry/com.arondor.common.reflection.bean.java.AccessibleClassBean"/>
	</xsl:template>

	<xsl:template match="com.arondor.common.reflection.bean.java.AccessibleClassBean[annotations/entry/string[1]/text()='com.fast2.model.task.annotation.TaskType']">
		<xsl:message>Processing class : <xsl:value-of select="name"/>
		</xsl:message>

		<xsl:variable name="type">
			<xsl:call-template name="accessibleClassType">
				<xsl:with-param name="bean" select="."/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="href">
			<xsl:call-template name="accessibleClassHref">
				<xsl:with-param name="bean" select="."/>
			</xsl:call-template>
		</xsl:variable>


		<xsl:document href="{$urlprefix}{$href}" method="text">
			<xsl:text>## </xsl:text>

			<xsl:call-template name="shortClassName">
				<xsl:with-param name="className" select="name/text()"/>
			</xsl:call-template>
			<xsl:text> &lt;small&gt; - </xsl:text>
			<xsl:value-of select="str:replace(description/text(),'[\u2022,\u2023,\u25E6,\u2043,\u2219]','.')"/>
			<xsl:text> &lt;/small&gt;</xsl:text>
			<xsl:text> {#</xsl:text>
			<xsl:call-template name="shortClassName">
				<xsl:with-param name="className" select="name/text()"/>
			</xsl:call-template>
			<xsl:text> data-toc-label="</xsl:text>
			<xsl:call-template name="shortClassName">
				<xsl:with-param name="className" select="name/text()"/>
			</xsl:call-template>
			<xsl:text>"}</xsl:text>
			<xsl:text>&#xA;</xsl:text>
			<xsl:text>&#xA;</xsl:text>
			<xsl:value-of select="translate(longDescription/text(),'&quot;','_')"/>
			<xsl:text>&#xA;</xsl:text>
			<xsl:text>&#xA;</xsl:text>


			<xsl:variable name="allFields" select="accessibleFields/entry[string/text() != 'manager' and string/text() != 'name']/com.arondor.common.reflection.bean.java.AccessibleFieldBean[writable/text() = 'true']"/>
			<xsl:variable name="mandatoryFields" select="$allFields[mandatory='true']"/>
			<xsl:variable name="optionalFields" select="$allFields[mandatory='false']"/>

			<xsl:if test="count($mandatoryFields) &gt; 0">
				<xsl:text>&lt;b&gt;Mandatory settings&lt;/b&gt;</xsl:text>
				<xsl:text>&#xA;</xsl:text>
				<xsl:text>
|Key      | Type    | Description | </xsl:text>
				<xsl:if test="count($mandatoryFields[defaultValue]) &gt; 0">
					<xsl:text> Default value |</xsl:text>
				</xsl:if>

				<xsl:text>
| - | - | - |</xsl:text>
				<xsl:if test="count($mandatoryFields[defaultValue]) &gt; 0">
					<xsl:text> - |</xsl:text>
				</xsl:if>
				<xsl:text>&#xA;</xsl:text>

				<xsl:apply-templates select="$mandatoryFields"/>
			</xsl:if>

			<xsl:if test="count($optionalFields) &gt; 0">
				<xsl:text>&#xA;</xsl:text>
				<xsl:text>&#xA;</xsl:text>
				<xsl:text>&lt;b&gt;Optional settings&lt;/b&gt;</xsl:text>
				<xsl:text>&#xA;</xsl:text>

				<xsl:text>
|Key      | Type    | Description | </xsl:text>
				<xsl:if test="count($optionalFields[defaultValue]) &gt; 0">
					<xsl:text> Default value |</xsl:text>
				</xsl:if>

				<xsl:text>
| - | - | - |</xsl:text>
				<xsl:if test="count($optionalFields[defaultValue]) &gt; 0">
					<xsl:text> - |</xsl:text>
				</xsl:if>
				<xsl:text>&#xA;</xsl:text>
				<xsl:apply-templates select="$optionalFields"/>
			</xsl:if>
			<xsl:text>&#xA;</xsl:text>
			<xsl:text>&#xA;</xsl:text>
			<xsl:text>&#xA;</xsl:text>
		</xsl:document>
	</xsl:template>

	<xsl:template match="com.arondor.common.reflection.bean.java.AccessibleFieldBean">

		<xsl:text> | </xsl:text>
		<xsl:value-of select="description/text()"/>
		<xsl:text> | </xsl:text>
		<xsl:call-template name="displayClassName"/>
		<xsl:text> | </xsl:text>
		<xsl:if test="longDescription">
			<xsl:call-template name="string-replace-all">
				<xsl:with-param name="text" select="normalize-space(longDescription/text())"/>
				<xsl:with-param name="replace">-</xsl:with-param>
				<xsl:with-param name="by">&lt;br/&gt;-</xsl:with-param>
			</xsl:call-template>

			<xsl:if test="example">
				<xsl:text> &lt;br/&gt; &lt;p&gt; Ex/  </xsl:text>

				<xsl:call-template name="string-replace-all">
					<xsl:with-param name="text" select="example/text()"/>
					<xsl:with-param name="replace">"</xsl:with-param>
					<xsl:with-param name="by">\"</xsl:with-param>
				</xsl:call-template>

				<xsl:text>&lt;/p&gt;</xsl:text>
			</xsl:if>
		</xsl:if>

		<xsl:if test="defaultValue">
			<xsl:text> | `</xsl:text>
			<xsl:value-of select="defaultValue/text()"/>
			<xsl:text> `</xsl:text>
		</xsl:if>
		<xsl:text> | &#xA;</xsl:text>
	</xsl:template>

	<xsl:template name="displayClassName">
		<xsl:variable name="class" select="className/text()"/>
		<xsl:choose>
			<xsl:when test="$class = 'java.lang.String'">
				<xsl:text>`String`</xsl:text>
			</xsl:when>
			<xsl:when test="$class = 'int' or $class='java.lang.Integer'">
				<xsl:text>`Integer`</xsl:text>
			</xsl:when>
			<xsl:when test="$class = 'long'  or $class='java.lang.Long'">
				<xsl:text>`Long`</xsl:text>
			</xsl:when>
			<xsl:when test="$class = 'boolean' or $class='java.lang.Boolean'">
				<xsl:text>`Boolean`</xsl:text>
			</xsl:when>
			<xsl:when test="$class = 'float' or $class='java.lang.Float'">
				<xsl:text>`Float`</xsl:text>
			</xsl:when>
			<xsl:when test="$class = 'Double' or $class='java.lang.Double'">
				<xsl:text>`Double`</xsl:text>
			</xsl:when>
			<xsl:when test="$class='java.util.List' and genericParameterClassList/string/text() = 'java.lang.String'">
				<xsl:text>`String list`</xsl:text>
			</xsl:when>
			<xsl:when test="$class='java.util.Map' and genericParameterClassList/string[1]/text() = 'java.lang.String' and genericParameterClassList/string[2]/text() = 'java.lang.String'">
				<xsl:text>`String/String map`</xsl:text>
			</xsl:when>
			<xsl:when test="$class='java.util.Map' and genericParameterClassList/string[1]/text() = 'java.lang.String' and genericParameterClassList/string[2]/text() = 'com.fast2.model.context.Pattern'">
				<xsl:text>`String/Pattern map`</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="targetClass" select="/com.arondor.common.reflection.catalog.SimpleAccessibleClassCatalog/accessibleClassMap/entry[string/text()=$class]/com.arondor.common.reflection.bean.java.AccessibleClassBean[annotations/entry[string[1]/text()='com.fast2.model.task.annotation.TaskType']]"/>
				<xsl:choose>
					<xsl:when test="$targetClass">
						<xsl:text>[</xsl:text>
						<xsl:call-template name="shortClassName">
							<xsl:with-param name="className" select="$class"/>
						</xsl:call-template>
						<xsl:text>]</xsl:text>
						<xsl:text>(</xsl:text>
						<xsl:call-template name="accessibleClassLink">
							<xsl:with-param name="bean" select="$targetClass"/>
						</xsl:call-template>
						<xsl:text>)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="shortClassName">
							<xsl:with-param name="className" select="$class"/>
						</xsl:call-template>
						<xsl:message>Could not resolve: <xsl:value-of select="$class"/>
						</xsl:message>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="last-substring-after">
		<xsl:param name="haystack"/>
		<xsl:param name="needle"/>

		<xsl:choose>
			<xsl:when test="contains($haystack, $needle)">
				<xsl:call-template name="last-substring-after">
					<xsl:with-param name="haystack" select="substring-after($haystack, $needle)"/>
					<xsl:with-param name="needle" select="$needle"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$haystack"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="shortClassName">
		<xsl:param name="className"/>
		<xsl:call-template name="last-substring-after">
			<xsl:with-param name="haystack" select="$className"/>
			<xsl:with-param name="needle" select="'.'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- {$type}/{name/text()}.md -->
	<xsl:template name="accessibleClassHref">
		<xsl:param name="bean"/>
		<xsl:variable name="type">
			<xsl:call-template name="accessibleClassType">
				<xsl:with-param name="bean" select="$bean"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="shortClassName">
			<xsl:call-template name="shortClassName">
				<xsl:with-param name="className" select="name/text()"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="concat($type,'/',$shortClassName,'.temp')"/>
	</xsl:template>

	<xsl:template name="accessibleClassLink">
		<xsl:param name="bean"/>
		<xsl:variable name="type">
			<xsl:call-template name="accessibleClassType">
				<xsl:with-param name="bean" select="$bean"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="shortClassName">
			<xsl:call-template name="shortClassName">Key   
				<xsl:with-param name="className" select="$bean/name/text()"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="lowerCase" select="translate($shortClassName, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
		<xsl:variable name="typeLowerCase" select="translate($type, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>

		<xsl:value-of select="concat('../', $type,'/#',$shortClassName)"/>

	</xsl:template>


	<xsl:template name="accessibleClassType">
		<xsl:param name="bean"/>
		<xsl:variable name="acrType" select="$bean/annotations/entry[string[1]/text()='com.fast2.model.task.annotation.TaskType']/com.arondor.common.reflection.bean.java.AccessibleAnnotationBean/value/text()"/>
		<xsl:value-of select="$acrType"/>
	</xsl:template>

	<xsl:template name="string-replace-all">
		<xsl:param name="text" />
		<xsl:param name="replace" />
		<xsl:param name="by" />
		<xsl:choose>
			<xsl:when test="$text = '' or $replace = '' or not($replace)">
				<!-- Prevent this routine from hanging -->
				<xsl:value-of select="$text" />
			</xsl:when>
			<xsl:when test="contains($text, $replace)">
				<xsl:value-of select="substring-before($text,$replace)" />
				<xsl:value-of select="$by" />
				<xsl:call-template name="string-replace-all">
					<xsl:with-param name="text" select="substring-after($text,$replace)" />
					<xsl:with-param name="replace" select="$replace" />
					<xsl:with-param name="by" select="$by" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="com.arondor.common.reflection.bean.java.AccessibleClassBean">
		<!-- <xsl:message>Skipped class : <xsl:value-of select="name"/></xsl:message> -->
	</xsl:template>
</xsl:stylesheet>
