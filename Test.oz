
\insert 'Main.oz'


%Test for compound statements
local Test1 Test2 Test3 Test4 Test5 in
%	Test for stack implementation
    Test1 = [[[nop]] [nop]]

%	Test for variable creation
	Test2 = [localvar ident(x) [localvar ident(y) [localvar ident(x) [nop]]]]

%	Test for variable to variable binding
	Test3 = [localvar ident(x) [ [localvar ident(y) [bind ident(x) ident(y)]  ]]]

% 	Test for Value creation
	Test4 = [localvar ident(x)
	    [localvar ident(y)
	     [
	      [bind ident(x) literal(1)]
	      [bind ident(y) literal(2)]
		  [bind ident(x) ident(y)]
	     ]
	    ]
	   ]	

	%	Test for record creation
	Test5 = [
	    [ localvar ident(z)
	      [ localvar ident(x)
		[ localvar ident(y)
		  [ localvar ident(w)
		    [ [bind ident(x) [record literal(testRecord) [ [literal(onlyFeature) ident(z)] ]]]
		      [bind ident(z) literal(2)]
		      [bind ident(y) [record literal(testRecord) [ [literal(onlyFeature) ident(w)] ]]]
		      [bind ident(w) literal(2)]
		      [bind ident(x) ident(y)]
		    ]
		  ]
		]
	      ]
	    ]
	   ]

	       
   {Inspect {Interpret Test1}}
   {Inspect {Interpret Test2}}
   {Inspect {Interpret Test3}}
   {Inspect {Interpret Test4}}
   {Inspect {Interpret Test5}}
end

