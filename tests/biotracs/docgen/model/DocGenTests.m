classdef DocGenTests < matlab.unittest.TestCase
    
    properties (TestParameter)
    end
    
    properties
        workingDir = fullfile(biotracs.core.env.Env.workingDir(), '/biotracs/docgen/DocGenTests');
    end
    
    methods (Test)
        
        
        function testDocGen(testCase)

            w = biotracs.docgen.model.DocGen();
            fileImporter = w.getNode('FileImporter');
            fileImporter.addInputFilePath( biotracs.core.env.Env.vars('BIOTRACS_M_METADATA_DIR') );
            %fileImporter.addInputFilePath( fullfile(biotracs.core.env.Env.rootDir(), '\OpenMS') );
            w.getConfig()...
                .updateParamValue('WorkingDirectory', testCase.workingDir);
            
            w.writeParamValue('DocuGenerator:LicenseUrl', '');
            w.writeParamValue('DocuGenerator:LicenseText', 'BIOASTER Licence');
            w.run();
                
        end
        
    end
end