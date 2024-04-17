class DocumentsController < ApplicationController
  
    def index
      @documents = Document.all
    end

    def new
      @document = Document.new
    end
  
    def create
      @document = Document.new(document_params)
      if @document.save
        process_excel(@document.excel_file)
        redirect_to new_document_path, notice: 'File was successfully uploaded and processed.'
      else
        render :new
      end
    end

    def destroy
      @document = Document.find_by(id: params[:id])
      if @document
        @document.excel_file.purge
        @document.destroy
        redirect_to documents_path, notice: 'Document was successfully deleted.'
      else
        redirect_to documents_path, alert: 'Document not found.'
      end
    end
    
  
  
    private
  
    def document_params
      params.require(:document).permit(:name, :excel_file)
    end

    def process_excel(attachment)
      return unless attachment.attached?
      return unless attachment.content_type == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    
      attachment.open do |file|
        # Ensure the file is read correctly by Roo
        xlsx = Roo::Excelx.new(file.path)
        xlsx.sheet(0).each_row_streaming do |row|
          # Process each row
        end
      ensure
        file.close if file
      end
    end
    
end
  