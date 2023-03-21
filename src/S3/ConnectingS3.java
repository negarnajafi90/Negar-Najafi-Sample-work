package S3;


import com.itextpdf.html2pdf.HtmlConverter;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import com.itextpdf.styledxmlparser.IXmlParser;

import com.itextpdf.io.source.OutputStream;

import  com.itextpdf.layout.Document;

import com.itextpdf.io.font.FontCacheKey;

import com.itextpdf.svg.processors.ISvgConverterProperties;


public class ConnectingS3 {

	public static void main(String[] args) throws FileNotFoundException {
		
		
		ConnectionToS3 a= new ConnectionToS3();
		
		a.ConnectionCreationToS3();

	}

}
