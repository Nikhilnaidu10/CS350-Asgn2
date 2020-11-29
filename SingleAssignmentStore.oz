declare Dict RetrieveFromSAS BindRefToKeyInSAS BindValueToKeyInSAS AddKeyToSAS in

Dict = {Dictionary.new}

proc {BindValueToKeyInSAS Key Val}
   local CurVal in
      CurVal = {Dictionary.get Dict Key}
      
    if {List.is CurVal} orelse CurVal \= Val then 
	 case CurVal 
	 of equivalence(X) then {Dictionary.put Dict Key Val}
	 [] reference(X) then {BindValueToKeyInSAS X Val}
	 else raise alreadyAssigned(Key Val CurVal) end
	 end
      end
   end
end


proc {BindRefToKeyInSAS Key RefKey}
   if Key \= RefKey then
      {Dictionary.put Dict Key reference(RefKey)}
   end
end

fun {AddKeyToSAS}
   local Len in 
      Len = {List.length {Dictionary.keys Dict}}
      {Dictionary.put Dict Len equivalence(Len)}
      Len
   end
end

fun {RetrieveFromSAS Key}
   local TempValue in
      TempValue = {Dictionary.get Dict Key}
      
      case TempValue
      of reference(X) then
	    {RetrieveFromSAS X}
      else TempValue
      end
   end
end

   

						  
