
\insert 'Stack.oz'
\insert 'Unify.oz'

declare Main Interpret in

fun {Interpret Stmt}
	{Main [semstmt(stmt:Stmt env:env())]}
end

fun {Main Stack}
   	{Inspect {Dictionary.entries Dict}}
   	{Inspect {TopStack Stack}}
   	local TopSemStmt TopStmt TopEnv RmStack in
	TopSemStmt = {TopStack Stack}
	if TopSemStmt == nil then
	    accepted
	else
	    TopStmt = TopSemStmt.stmt
	    TopEnv = TopSemStmt.env
	    RmStack = {PopStack Stack}

	    case TopStmt
	    of nop then
	       {Main RmStack}
	    [] localvar|ident(V)|InnerStmt then
	    	local TempKey NewEnv in
			  	TempKey = {AddKeyToSAS}
			  	NewEnv = {Record.adjoinAt TopEnv V TempKey}
			  	{Main {PushStack RmStack semstmt(stmt:InnerStmt env:NewEnv)}}
	       	end

	    [] bind|ident(X)|V|nil then
	       	if {Value.hasFeature TopEnv X} then
			  	case V
			  	of ident(Y) then
			     	if {Value.hasFeature TopEnv Y} then
						{Unify ident(X) ident(Y) TopEnv}
						{Main RmStack}
			     	else raise notIntroduced(Y) end
			     	end
				[] literal(Y) then
					{Unify ident(X) literal(Y) TopEnv}
					{Main RmStack}
				[] record|L|Pairs then
				   {Unify ident(X) record|L|Pairs TopEnv}
				   {Main RmStack}
				[] literal(t) then
					{Unify ident(X) literal(t) TopEnv}
					{Main RmStack}
				[] literal(f) then {Unify ident(X) literal(f) TopEnv}
				   {Main RmStack}
				   
				else raise invalidExpression(ident(X) V) end
		  		end				  
	    	else raise notIntroduced(X) end
	       	end

	    [] S1|S2 then
	       local TempStack StackNew in
		  if S2 \= nil then
		     TempStack = {PushStack RmStack semstmt(stmt:S2 env:TopEnv)}
		  else
		     TempStack = RmStack
		  end
		  StackNew = {PushStack TempStack semstmt(stmt:S1 env:TopEnv)}
		  {Main StackNew}
	       end

	    else false
	    end
	 end
      end
end

