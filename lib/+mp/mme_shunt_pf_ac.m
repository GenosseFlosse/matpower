classdef mme_shunt_pf_ac < mp.mme_shunt
% mp.mme_shunt_pf_ac - Math model element for shunt for AC power flow.

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

            %% shunt complex power consumption
            pp = nm.get_idx('port');
            S = nm.soln.gs_(pp.i1.shunt:pp.iN.shunt) * dm.base_mva;

            %% update in the data model
            dme = obj.data_model_element(dm);
            dme.tab.p(dme.on) = real(S);
            dme.tab.q(dme.on) = imag(S);
        end
    end     %% methods
end         %% classdef
