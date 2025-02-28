classdef mme_gen_pf_dc < mp.mme_gen
% mp.mme_gen_pf_dc - Math model element for generator for DC power flow.

%   MATPOWER
%   Copyright (c) 2022-2023, Power Systems Engineering Research Center (PSERC)
%   by Ray Zimmerman, PSERC Cornell
%
%   This file is part of MATPOWER.
%   Covered by the 3-clause BSD License (see LICENSE file for details).
%   See https://matpower.org for more info.

%     properties
%     end     %% properties

    methods
        function obj = data_model_update(obj, mm, nm, dm, mpopt)
            %

            %% generator active power
            ss = nm.get_idx('state');
            pg = nm.soln.z(ss.i1.gen:ss.iN.gen) * dm.base_mva;

            %% update in the data model
            dme = obj.data_model_element(dm);
            dme.tab.pg(dme.on) = pg;
            dme.tab.qg(dme.on) = 0;
        end
    end     %% methods
end         %% classdef
