private void mergeFiles() throws IOException {
	String folderPath = "C:\\...\\Source\\Batch1";
	PrintWriter writer = new PrintWriter(folderPath + "\\finwire_merged-FIN.txt", "UTF-8");
	String line = "";
	
	Files.walk(Paths.get(folderPath)).forEach(filePath -> {
		String currentFile = filePath.getFileName().toString();
		if((currentFile.contains("FINWIRE"))&&(!currentFile.endsWith(".csv"))){
			try (BufferedReader br = new BufferedReader(new FileReader(filePath.toString()))) {
				while ((line = br.readLine()) != null) {
					if(line.substring(15,18).equals("FIN")) {
						writer.print(line + "\n");
					}
				}
			} catch (IOException ex) {
				System.out.println(ex);
			}
		}
	});
	writer.close();
}