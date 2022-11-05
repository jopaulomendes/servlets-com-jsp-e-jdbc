package util;

import java.io.File;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletContext;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

public class ReportUtil implements Serializable {

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("rawtypes")
	public byte[] gerarRelatorioPdf(List listDados, String nomeRelatorio, ServletContext context) throws Exception {
		
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(listDados);
		
		String caminhoJasper = context.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		@SuppressWarnings("unchecked")
		JasperPrint jasperPrint = JasperFillManager.fillReport(caminhoJasper, new HashMap(), dataSource);
		
		return JasperExportManager.exportReportToPdf(jasperPrint);
	}
}
