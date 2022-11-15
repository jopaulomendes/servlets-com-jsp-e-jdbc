package util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletContext;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRXlsExporter;

public class ReportUtil implements Serializable {

	private static final long serialVersionUID = 1L;

	@SuppressWarnings({"rawtypes", "unchecked"})
	public byte[] gerarRelatorioPdf(List listDados, String nomeRelatorio, ServletContext context) throws Exception {		
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(listDados);
		
		String caminhoJasper = context.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(caminhoJasper, new HashMap(), dataSource);
		
		return JasperExportManager.exportReportToPdf(jasperPrint);
	}
	
	public byte[] gerarRelatorioExcel(List listDados, String nomeRelatorio, ServletContext context) throws Exception {		
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(listDados);
		
		String caminhoJasper = context.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(caminhoJasper, new HashMap(), dataSource);
		
		JRExporter exporter = new JRXlsExporter(); // Excel
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		
		ByteArrayOutputStream stream = new ByteArrayOutputStream();
		
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, stream);
		exporter.exportReport();
		
		return stream.toByteArray();
	}
}
