-- /* vim: set cin ts=4 sw=4 : */
-- Test for 'cindent'

local helpers = require('test.functional.helpers')
local feed, insert, source = helpers.feed, helpers.insert, helpers.source
local clear, execute, expect = helpers.clear, helpers.execute, helpers.expect

describe('3', function()
  setup(clear)

  it('is working', function()
    insert([[
/* start of AUTO matically checked vim: set ts=4 : */
{
	if (test)
		cmd1;
	cmd2;
}

{
	if (test)
		cmd1;
	else
		cmd2;
}

{
	if (test)
	{
		cmd1;
		cmd2;
	}
}

{
	if (test)
	{
		cmd1;
		else
	}
}

{
	while (this)
		if (test)
			cmd1;
	cmd2;
}

{
	while (this)
		if (test)
			cmd1;
		else
			cmd2;
}

{
	if (test)
	{
		cmd;
	}

	if (test)
		cmd;
}

{
	if (test) {
		cmd;
	}

	if (test) cmd;
}

{
	cmd1;
	for (blah)
		while (this)
			if (test)
				cmd2;
	cmd3;
}

{
	cmd1;
	for (blah)
		while (this)
			if (test)
				cmd2;
	cmd3;

	if (test)
	{
		cmd1;
		cmd2;
		cmd3;
	}
}


/* Test for 'cindent' do/while mixed with if/else: */

{
	do
		if (asdf)
			asdfasd;
	while (cond);

	do
		if (asdf)
			while (asdf)
				asdf;
	while (asdf);
}

/* end of AUTO */
    ]])

    -- execute{"so small.vim"}
    execute("set cin")
    execute("set ts=4")
    execute("set sw=4")
    execute("set modeline")
    execute("edit")
    execute("/start of AUTO")
    execute("=/end of AUTO")

    expect([[
/* start of AUTO matically checked vim: set ts=4 : */
{
	if (test)
		cmd1;
	cmd2;
}

{
	if (test)
		cmd1;
	else
		cmd2;
}

{
	if (test)
	{
		cmd1;
		cmd2;
	}
}

{
	if (test)
	{
		cmd1;
		else
	}
}

{
	while (this)
		if (test)
			cmd1;
	cmd2;
}

{
	while (this)
		if (test)
			cmd1;
		else
			cmd2;
}

{
	if (test)
	{
		cmd;
	}

	if (test)
		cmd;
}

{
	if (test) {
		cmd;
	}

	if (test) cmd;
}

{
	cmd1;
	for (blah)
		while (this)
			if (test)
				cmd2;
	cmd3;
}

{
	cmd1;
	for (blah)
		while (this)
			if (test)
				cmd2;
	cmd3;

	if (test)
	{
		cmd1;
		cmd2;
		cmd3;
	}
}


/* Test for 'cindent' do/while mixed with if/else: */

{
	do
		if (asdf)
			asdfasd;
	while (cond);

	do
		if (asdf)
			while (asdf)
				asdf;
	while (asdf);
}

/* end of AUTO */
    ]])
  end)
end)
