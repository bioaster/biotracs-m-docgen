% BIOASTER
%> @file		Docu.m
%> @class		biotracs.Docu.model.Docu
%> @link		http://www.bioaster.org
%> @copyright	Copyright (c) 2014, Bioaster Technology Research Institute (http://www.bioaster.org)
%> @license		BIOASTER
%> @date		2018

classdef DocGen < biotracs.core.mvc.model.Workflow
    
    % -------------------------------------------------------
    % Public methods
    % -------------------------------------------------------
    
    methods
        
        % Constructor
        function this = DocGen()
            this@biotracs.core.mvc.model.Workflow();
            this.doBuildWorkflow();
        end

    end
    
    % -------------------------------------------------------
    % Protected methods
    % -------------------------------------------------------
    
    methods(Access = protected)
       
        function this =  doBuildWorkflow( this )
            [ fileImporter ]                            = this.doAddFileImporter();
            [ docuGenerator ]                           = this.doAddDocuGenereator();
            [ viewExporter ]                            = this.doAddViewExporter();
            fileImporter.getOutputPort('DataFileSet')   .connectTo( docuGenerator.getInputPort('DataFileSet') );
            docuGenerator.getOutputPort('DocuSet')      .connectTo( viewExporter.getInputPort('Resource') );    
        end
        
        function [ fileImporter ] = doAddFileImporter( this )
            fileImporter = biotracs.core.adapter.model.FileImporter();
            fileImporter.getConfig()...
                .updateParamValue('FileExtensionFilter','\.m$')...
                .updateParamValue('Recursive', true);
            this.addNode(fileImporter, 'FileImporter');
        end
        
        function [ docuGenerator ] = doAddDocuGenereator( this )
            docuGenerator = biotracs.core.docu.model.DocuGenerator();
            this.addNode(docuGenerator, 'DocuGenerator');
        end
        
        function [ viewExporter ] = doAddViewExporter( this )
            viewExporter = biotracs.core.adapter.model.ViewExporter();
            viewExporter.getConfig()...
                .updateParamValue('FileExtension','.html')...
                .updateParamValue('ViewNames', {'Html'});
            this.addNode(viewExporter, 'ViewExporter');
        end
        
    end

end
