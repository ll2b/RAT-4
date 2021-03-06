;------------------------------------------------------------------------
; RAT - Radar Tools
;------------------------------------------------------------------------
; RAT Module: get_par
; written by    : Maxim Neumann
; last revision : 17.Oct.2005
; PARAMETERS:
; RETURN: status value:
;   0: everything ok, the value is provided
;   1: error: wrong entry name
;   2: error: value not set
; EXAMPLE:
;------------------------------------------------------------------------
; The contents of this file are subject to the Mozilla Public License
; Version 1.1 (the "License"); you may not use this file except in
; compliance with the License. You may obtain a copy of the License at
; http://www.mozilla.org/MPL/
;
; Software distributed under the License is distributed on an "AS IS"
; basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
; License for the specific language governing rights and limitations
; under the License.
;
; The Initial Developer of the Original Code is the RAT development team.
; All Rights Reserved.
;------------------------------------------------------------------------

function get_par, name, value
  common rit, pars             ; pars== parameters structure ==parstruct

  par_names = tag_names(pars)
  i = where(strlowcase(par_names) eq strlowcase(name),whereNr)

  value  = !VALUES.F_NAN

;;; ERROR: wrong entry name
  if whereNr lt 1 then $
     return, 1

;;; ERROR: value not set
  if pars.(i) eq ptr_new() then $
     return, 2

  value =  *pars.(i)
  return, 0
end
