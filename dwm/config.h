/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "siji:size=13" };
/*static const char dmenufont[]       = "monospace:size=10";*/
static const char col_n1[]       = "#222222";
static const char col_n2[]       = "#444444";
static const char col_n3[]       = "#bbbbbb";
static const char col_n4[]       = "#ffffff";
static const char col_main[]        = "#005577";
static const unsigned int baralpha = 153;
static const unsigned int borderalpha = 153;
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_n3,    col_n1,    col_n2 },
	[SchemeSel]  = { col_n4,    col_main,  col_main  },
};
static const unsigned int alphas[][3]      = {
    /*               fg      bg        border*/
    [SchemeNorm] = { OPAQUE, baralpha, borderalpha },
  	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{  NULL,      NULL,       NULL,       0,            False,       -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *roficmd[] = { "rofi","-show","drun","-show-icons", NULL };
static const char *termcmd[] = { "kitty", NULL };
static const char *upvol[]   = { "/usr/bin/pactl", "set-sink-volume", "0", "+5%",    NULL };
static const char *downvol[] = { "/usr/bin/pactl", "set-sink-volume", "0", "-5%",    NULL };
static const char *mutevol[] = { "/usr/bin/pactl", "set-sink-mute",   "0", "toggle", NULL };
static const char *light_up[]   = { "/usr/bin/brightnessctl", "set", "+5", NULL };
static const char *light_down[] = { "/usr/bin/brightnessctl", "set", "5-", NULL };
static const char *browser[] = { "firefox", NULL };
static const char *fmngr[]   = { "pcmanfm", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = roficmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
  { MODKEY,                       XK_z,      togglebar,      {0} }, 
  { MODKEY,                       XK_b,      spawn,          {.v = browser } },
	{ MODKEY|ShiftMask,             XK_f,      spawn,          {.v = fmngr } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
  { MODKEY|ShiftMask,             XK_Return, zoom,           {0} }, 
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
/*{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },*/
	{ MODKEY,                       XK_f,      fullscreen,     {0} },
  { MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
  { MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
  { MODKEY,                       XK_plus,   setgaps,        {.i = +1 } },
  { MODKEY|ShiftMask,             XK_minus,  setgaps,        {.i = 0  } },
	{ 0,            XF86XK_AudioLowerVolume,   spawn,          {.v = downvol } },
	{ 0,            XF86XK_AudioMute,          spawn,          {.v = mutevol } },
	{ 0,            XF86XK_AudioRaiseVolume,   spawn,          {.v = upvol   } },
	{ 0,				    XF86XK_MonBrightnessUp,    spawn,	         {.v = light_up} },
	{ 0,				    XF86XK_MonBrightnessDown,  spawn,	         {.v = light_down} },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	{ MODKEY|ShiftMask,             XK_r,      quit,           {1} },
	{ MODKEY|ControlMask,           XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

