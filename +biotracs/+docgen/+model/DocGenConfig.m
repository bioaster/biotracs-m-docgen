% BIOASTER
%> @file		DocGenConfig.m
%> @class		biotracs.Docu.model.DocGenConfig
%> @link		http://www.bioaster.org
%> @copyright	Copyright (c) 2014, Bioaster Technology Research Institute (http://www.bioaster.org)
%> @license		BIOASTER
%> @date		2018


classdef DocGenConfig < biotracs.core.docu.model.DocuGeneratorConfig
	 
	 properties(Constant)
	 end
	 
	 properties(SetAccess = protected)
	 end

	 % -------------------------------------------------------
	 % Public methods
	 % -------------------------------------------------------
	 
	 methods
		  
		  % Constructor
		  %> @param[in] iInstrument The instrument of which this configuration is addressed
		  function this = DocGenConfig( )
				this@biotracs.core.docu.model.DocuGeneratorConfig( );
                this.createParam('Recursive', '',...
                    'Constraint', biotracs.core.constraint.IsPath(), ...
                    'Description', 'Input Directory for Ms2 Files in Negative mode ...must have \\ (double backslash) at the end of the directory');

          end

	 end
	 
	 % -------------------------------------------------------
	 % Protected methods
	 % -------------------------------------------------------
     
     methods(Access = protected)
  
      
         
     end

end
