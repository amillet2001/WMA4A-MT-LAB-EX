<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="portfolio">
    <html>
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="header/@name"/></title>
        <link href="https://fonts.googleapis.com/css2?family=Fredoka+One:wght@400&amp;family=Nunito:wght@400;600;700;800&amp;display=swap" rel="stylesheet" />
        <style>
        :root {
            --color-primary: #2ca6ff; /* sky highlight */
            --color-secondary: #4caf50; /* leaf green */
            --color-tertiary: #ff6b6b; /* flower red/pink */
            --color-text-dark: #2a2a2a;
            --color-background-blue: #e3f6ff;
            --color-background-green: #e7f6e7;
            --sky-top: #6fb8f0; /* darker, richer sky */
            --sky-mid: #a7def7; /* reduced whiteness */
            --horizon: #68c47a; /* green horizon strip */
            --soil: #8b5a2b;
            --grass: #43b049;
            --sun: #ffd54f;
            --flower: #ff99cc;
            --night-sky-top: #0b1020;
            --night-sky-mid: #101a34;
            --night-horizon: #2e5332;
            --night-soil: #3b2a18;
            --font-heading: "Fredoka One", cursive;
            --font-body: "Nunito", sans-serif;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }

        body {
            font-family: var(--font-body);
            background:
                radial-gradient(1200px 500px at 50% -10%, rgba(0,0,0,0.08), transparent 60%),
                linear-gradient(to bottom, var(--sky-top) 0%, var(--sky-mid) 45%, var(--horizon) 65%, var(--soil) 100%);
            color: white;
            min-height: 100vh;
            overflow-y: auto;
            transition: background 0.5s ease;
        }

        body.night {
            background:
                radial-gradient(1200px 500px at 50% -10%, rgba(0,0,0,0.25), transparent 60%),
                linear-gradient(to bottom, var(--night-sky-top) 0%, var(--night-sky-mid) 45%, var(--night-horizon) 65%, var(--night-soil) 100%);
        }

        nav {
            position: sticky;
            top: 0;
            z-index: 999;
            display: flex;
            justify-content: center;
            gap: 40px;
            padding: 15px 60px;
            min-height: 58px;
            background: linear-gradient(135deg, rgba(0,153,225,0.95), rgba(76,175,80,0.95));
            backdrop-filter: blur(10px);
            border-radius: 0 0 22px 22px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.25);
            transition: all 0.3s ease;
            will-change: background, box-shadow;
        }
        nav .menu-btn { display:none; margin-right:auto; background:transparent; border:none; color:#fff; font-size:1.6rem; cursor:pointer; }
        nav .links { display:flex; gap:40px; align-items:center; }

        nav a {
            color: #fff;
            text-decoration: none;
            font-size: 1.1em;
            font-weight: 700;
            letter-spacing: 0.5px;
            padding: 8px 14px;
            border-radius: 12px;
            position: relative;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        nav a:hover {
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 4px 10px rgba(255,255,255,0.25);
            transform: translateY(-2px) scale(1.05);
        }

        nav a::after {
            content: "";
            position: absolute;
            bottom: -6px;
            left: 50%;
            transform: translateX(-50%);
            width: 0%;
            height: 6px;
            background: repeating-linear-gradient(
                -20deg,
                #4caf50 0 8px,
                #66bb6a 8px 16px
            );
            border-radius: 10px;
            transition: width 0.3s ease;
        }

        nav a:hover::after,
        nav a.active::after {
            width: 70%;
        }

        nav a.active {
            background: rgba(255,255,255,0.25);
            color: #fff;
            box-shadow: 0 4px 14px rgba(255,255,255,0.3);
        }

        #home {
            scroll-margin-top: 100px;
        }

        .resume {
            display: grid;
            grid-template-rows: auto 1fr;
            color: white;
            max-width: 1100px;
            margin: 30px auto;
            gap: 48px;
        }

        .header {
            background: linear-gradient(180deg, rgba(255,255,255,0.7), rgba(255,255,255,0.15));
            display: flex;
            align-items: center;
            padding: 30px 60px;
            position: relative;
            box-shadow: inset 0 -10px 0 rgba(0, 0, 0, 0.15);
            border-radius: 18px;
            min-height: 220px;
        }

        /* Improve readability of header text in light mode */
        .header, .header .header-text, .header .header-text a {
            color: var(--color-text-dark);
        }
        .header-text h1 { color: var(--color-text-dark); }
        
        /* Night mode header text color */
        body.night .header, body.night .header .header-text, body.night .header .header-text a {
            color: #eaf4ff;
        }
        body.night .header-text h1 { color: #ffffff; }

        .header::before {
            content: "";
            position: absolute;
            left: 0;
            right: 0;
            bottom: -14px;
            height: 28px;
            background: repeating-linear-gradient(
                -15deg,
                var(--grass) 0 16px,
                #5dc462 16px 32px
            );
            border-radius: 0 0 18px 18px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
        }

        .clouds {
            position: absolute;
            inset: 0;
            pointer-events: none;
            overflow: hidden;
        }
        .cloud {
            position: absolute;
            background: #f7fbff;
            opacity: 0.9;
            filter: blur(0.5px) drop-shadow(0 2px 4px rgba(0,0,0,0.12));
            border-radius: 50px;
            width: 160px;
            height: 60px;
            box-shadow: 50px 10px 0 10px #f7fbff, -40px 15px 0 0 #f7fbff;
            animation: floatCloud 30s linear infinite;
            border: 1px solid rgba(0,0,0,0.06);
        }
        .cloud.small { width: 110px; height: 42px; }
        .cloud.xs { width: 80px; height: 30px; }
        @keyframes floatCloud { from { transform: translateX(-30%); } to { transform: translateX(130%); } }
        
        body.night .cloud {
            background: #c6d8ff;
            box-shadow: 50px 10px 0 10px #c6d8ff, -40px 15px 0 0 #c6d8ff;
            border-color: rgba(255,255,255,0.08);
            filter: blur(0.5px) drop-shadow(0 2px 6px rgba(0,0,0,0.25));
            opacity: 0.85;
        }

        .profile-section {
            display: flex;
            align-items: center;
            gap: 36px;
            z-index: 2;
        }

        .profile-pic {
            width: 140px;
            height: 140px;
            border-radius: 20px;
            border: 6px solid transparent;
            object-fit: cover;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.35);
            background:
                linear-gradient(180deg, rgba(255,255,255,0.9), rgba(255,255,255,0.7)) padding-box,
                conic-gradient(
                    from 0deg,
                    #43b049 0deg 60deg,
                    #66c96b 60deg 120deg,
                    #ffd54f 120deg 150deg,
                    #ff99cc 150deg 210deg,
                    #2ca6ff 210deg 270deg,
                    #66bb6a 270deg 330deg,
                    #43b049 330deg 360deg
                ) border-box;
            position: relative;
        }
        
        body.night .profile-pic {
            background:
                linear-gradient(180deg, rgba(16,26,52,0.85), rgba(16,26,52,0.65)) padding-box,
                conic-gradient(
                    from 0deg,
                    #2e7d32 0deg 60deg,
                    #43a047 60deg 120deg,
                    #ffe082 120deg 150deg,
                    #f48fb1 150deg 210deg,
                    #64b5f6 210deg 270deg,
                    #66bb6a 270deg 330deg,
                    #2e7d32 330deg 360deg
                ) border-box;
        }

        .header-text h1 {
            font-family: var(--font-heading);
            font-size: clamp(2rem, 5vw + 0.5rem, 3.2em);
            text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.35);
            margin-bottom: 8px;
            letter-spacing: 1px;
        }

        .header-text .subtitle {
            font-size: 1.15em;
            font-weight: 600;
            line-height: 1.5;
        }

        .main {
            background: white;
            color: var(--color-text-dark);
            padding: 36px 48px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 32px;
            border-radius: 18px;
            border: 4px solid var(--color-secondary);
            box-shadow:
                inset 3px 3px 10px rgba(255,255,255,0.8),
                inset -3px -3px 10px rgba(0,0,0,0.06),
                0 18px 40px rgba(0,0,0,0.12);
            position: relative;
        }

        .main::after {
            content: "";
            position: absolute;
            left: -4px;
            right: -4px;
            bottom: -24px;
            height: 24px;
            background: repeating-linear-gradient(
                -15deg,
                var(--grass) 0 14px,
                #66c96b 14px 28px
            );
            border-radius: 0 0 18px 18px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.18);
        }

        /* Ground plot styling inspired by garden tiles */
        .main.ground {
            background-image:
                radial-gradient(3px 3px at 20% 30%, rgba(0,0,0,0.12) 0 50%, transparent 51%),
                radial-gradient(2px 2px at 70% 60%, rgba(0,0,0,0.1) 0 50%, transparent 51%),
                radial-gradient(2.5px 2.5px at 40% 80%, rgba(255,255,255,0.06) 0 50%, transparent 51%),
                repeating-linear-gradient(0deg, rgba(0,0,0,0) 0 98px, rgba(0,0,0,0.18) 98px 100px),
                repeating-linear-gradient(90deg, rgba(0,0,0,0) 0 98px, rgba(0,0,0,0.18) 98px 100px),
                linear-gradient(180deg, #7a4a22, #5f3818);
            background-blend-mode: normal, normal, normal, multiply, multiply, normal;
            border-color: #6faa6f;
            box-shadow: inset 0 8px 18px rgba(0,0,0,0.25), 0 18px 40px rgba(0,0,0,0.18);
        }
        body.night .main.ground {
            background-image:
                radial-gradient(3px 3px at 20% 30%, rgba(255,255,255,0.06) 0 50%, transparent 51%),
                radial-gradient(2px 2px at 70% 60%, rgba(255,255,255,0.05) 0 50%, transparent 51%),
                radial-gradient(2.5px 2.5px at 40% 80%, rgba(255,255,255,0.04) 0 50%, transparent 51%),
                repeating-linear-gradient(0deg, rgba(255,255,255,0) 0 98px, rgba(255,255,255,0.1) 98px 100px),
                repeating-linear-gradient(90deg, rgba(255,255,255,0) 0 98px, rgba(255,255,255,0.1) 98px 100px),
                linear-gradient(180deg, #4a2e17, #2e1b0d);
            border-color: #2f6b2f;
        }
        /* Wooden fence at top of ground */
        .main.ground::before {
            content: "";
            position: absolute;
            left: -4px;
            right: -4px;
            top: -22px;
            height: 22px;
            background:
                repeating-linear-gradient(90deg,
                    #d0a46a 0 14px,
                    #c89754 14px 18px,
                    #d0a46a 18px 28px,
                    #b88845 28px 32px
                );
            border-radius: 18px 18px 0 0;
            box-shadow: 0 -2px 0 rgba(0,0,0,0.15), 0 4px 10px rgba(0,0,0,0.25);
        }
        body.night .main.ground::before {
            background:
                repeating-linear-gradient(90deg,
                    #8d6a3b 0 14px,
                    #7a5a31 14px 18px,
                    #8d6a3b 18px 28px,
                    #6a4e2a 28px 32px
                );
        }

        section {
            grid-column: 1 / -1;
            scroll-margin-top: 90px;
        }

        .section {
            background: linear-gradient(160deg, #ffffff, #f7fbff);
            border-radius: 16px;
            padding: 26px;
            border: 3px solid rgba(76,175,80,0.18);
            box-shadow: 0 10px 28px rgba(0,0,0,0.08);
            position: relative;
            margin-bottom: 18px;
            overflow: hidden;
        }
        
        /* Night mode: section cards and text */
        body.night .main { color: #e8f0ff; }
        body.night .section {
            background: linear-gradient(160deg, #1b2230, #141c28);
            border-color: rgba(255,255,255,0.14);
            box-shadow: 0 10px 28px rgba(0,0,0,0.4);
        }
        body.night .section h2 {
            color: #a6d5ff;
            background: linear-gradient(45deg, #163a2a, #1a2b3a);
            border-color: rgba(166,213,255,0.35);
        }
        body.night .section a { color: #cfe8ff; }
        body.night .school-name { color: #a6d5ff; }
        body.night .school-location { color: #c7d3e6; }
        body.night .education li {
            background: linear-gradient(135deg, #1a2633, #1c2e26);
            border-left: 6px solid #ff8fa3;
            box-shadow: 0 6px 16px rgba(0,0,0,0.45);
        }

        .section + .section {
            margin-top: 8px;
        }

        .section h2 {
            font-family: var(--font-heading);
            color: var(--color-secondary);
            font-size: 1.6em;
            margin-bottom: 18px;
            text-align: center;
            background: linear-gradient(45deg, var(--color-background-green), var(--color-background-blue));
            padding: 12px;
            border-radius: 12px;
            border: 2px solid var(--color-secondary);
            box-shadow: 0 4px 10px rgba(0,0,0,0.06);
        }

        .section::before {
            content: attr(data-icon);
            position: absolute;
            top: 8px;
            left: 10px;
            font-size: 1.4em;
            opacity: 0.9;
        }

        .section ul {
            list-style: none;
            padding-left: 6px;
        }

        .section li {
            margin: 8px 0;
            padding: 6px 0;
            font-weight: 600;
        }

        .education li {
            background: linear-gradient(135deg, var(--color-background-blue), var(--color-background-green));
            padding: 16px;
            border-radius: 12px;
            border-left: 6px solid var(--color-tertiary);
            box-shadow: 0 6px 14px rgba(0,0,0,0.06);
            margin-bottom: 12px;
        }

        .school-name {
            font-size: 1.08em;
            color: var(--color-primary);
            font-weight: 800;
            margin-bottom: 6px;
        }

        .school-location {
            color: #666;
            font-size: 0.95em;
            margin-bottom: 6px;
        }

        .year {
            color: var(--color-tertiary);
            font-weight: 800;
            font-size: 1.0em;
            float: right;
            background: rgba(255,51,51,0.08);
            padding: 4px 10px;
            border-radius: 18px;
        }

        .contact-row {
            display: flex;
            align-items: center;
            gap: 18px;
            margin-top: 12px;
            flex-wrap: nowrap;
            background: linear-gradient(120deg, rgba(76,175,80,0.12), rgba(44,166,255,0.08));
            border: 2px solid rgba(76,175,80,0.18);
            padding: 20px;
            border-radius: 16px;
            box-shadow: 0 8px 22px rgba(0,0,0,0.08);
        }
        body.night .contact-row {
            background: linear-gradient(120deg, rgba(22,58,42,0.55), rgba(16,26,52,0.55));
            border-color: rgba(166,213,255,0.18);
            box-shadow: 0 10px 26px rgba(0,0,0,0.4);
        }
        .contact-row form {
            display: grid;
            gap: 10px;
            min-width: 100%;
            background: rgba(255,255,255,0.9);
            border-radius: 14px;
            padding: 18px 20px;
            border: 2px solid rgba(44,166,255,0.18);
            box-shadow:
                inset 0 3px 8px rgba(255,255,255,0.65),
                inset 0 -3px 8px rgba(0,0,0,0.05),
                0 10px 26px rgba(0,0,0,0.12);
        }
        body.night .contact-row form {
            background: rgba(16,26,52,0.85);
            border-color: rgba(166,213,255,0.28);
            box-shadow:
                inset 0 3px 8px rgba(255,255,255,0.12),
                inset 0 -3px 8px rgba(0,0,0,0.45),
                0 12px 28px rgba(0,0,0,0.45);
        }
        .contact-row form label {
            font-weight: 800;
            color: var(--color-text-dark);
            letter-spacing: 0.4px;
        }
        body.night .contact-row form label {
            color: #eaf4ff;
        }
        .contact-row form input,
        .contact-row form textarea {
            padding: 10px 12px;
            border-radius: 10px;
            border: 2px solid rgba(44,166,255,0.25);
            font-family: inherit;
            font-size: 0.95em;
            color: var(--color-text-dark);
            background: rgba(255,255,255,0.95);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        body.night .contact-row form input,
        body.night .contact-row form textarea {
            border-color: rgba(166,213,255,0.35);
            background: rgba(14,22,38,0.85);
            color: #eaf0ff;
        }
        .contact-row form textarea {
            min-height: 110px;
            resize: vertical;
        }
        .contact-row form input:focus,
        .contact-row form textarea:focus {
            outline: none;
            border-color: rgba(76,175,80,0.6);
            box-shadow: 0 0 0 3px rgba(76,175,80,0.18);
        }
        body.night .contact-row form input:focus,
        body.night .contact-row form textarea:focus {
            border-color: rgba(166,213,255,0.7);
            box-shadow: 0 0 0 3px rgba(166,213,255,0.25);
        }
        .contact-row form button {
            margin-top: 6px;
            border: none;
            border-radius: 999px;
            padding: 10px 16px;
            font-weight: 800;
            font-size: 0.95em;
            color: #fff;
            cursor: pointer;
            background: linear-gradient(135deg, var(--color-primary), var(--color-secondary));
            box-shadow: 0 6px 16px rgba(0,0,0,0.18);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .contact-row form button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.22);
        }

        .contact-info {
            display: flex;
            flex-direction: column;
            gap: 6px;
            font-weight: 700;
        }

        .contact-links {
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .contact-links img {
            width: 38px;
            height: 38px;
            object-fit: contain;
            display: inline-block;
            border-radius: 8px;
            border: 2px solid rgba(0,0,0,0.04);
            background: white;
        }

        #scrollTopBtn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 55px;
            height: 55px;
            border: none;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--color-primary), var(--color-secondary));
            color: white;
            font-size: 1.8em;
            cursor: pointer;
            box-shadow: 0 8px 18px rgba(0,0,0,0.25);
            display: none;
            transition: all 0.3s ease;
            z-index: 1000;
        }

        #scrollTopBtn:hover {
            transform: translateY(-4px) scale(1.1);
            background: linear-gradient(135deg, var(--color-secondary), var(--color-primary));
            box-shadow: 0 10px 22px rgba(0,0,0,0.35);
        }

        /* Garden Level progress */
        .garden-level {
            background:
                linear-gradient(180deg, #e8c084, #d0a46a);
            color: #3b2a18;
            border-radius: 12px;
            padding: 14px 18px;
            border: 3px solid rgba(59,42,24,0.35);
            box-shadow: inset 0 3px 0 rgba(255,255,255,0.35), 0 10px 28px rgba(0,0,0,0.28);
            display: grid;
            gap: 10px;
        }
        body.night .garden-level {
            background: linear-gradient(180deg, #b08952, #8d6a3b);
            color: #f5efe6;
            border-color: rgba(255,255,255,0.25);
        }
        .level-bar {
            height: 14px;
            background: #e6f4ea;
            border-radius: 999px;
            overflow: hidden;
            border: 2px solid rgba(76,175,80,0.35);
        }
        .level-bar > .fill {
            height: 100%;
            width: 0%;
            background: linear-gradient(90deg, #66bb6a, #43a047);
            box-shadow: inset 0 0 8px rgba(255,255,255,0.7);
            transition: width 1.2s ease;
        }
        .badges { display: flex; gap: 8px; align-items: center; flex-wrap: wrap; }
        .badge {
            background: #fff0f6;
            color: #a0004b;
            border: 2px solid #ffc1de;
            padding: 4px 10px;
            border-radius: 999px;
            font-weight: 800;
            font-size: 0.9em;
        }

        /* Night mode stars overlay */
        .stars {
            position: fixed;
            inset: 0;
            pointer-events: none;
            background-image: radial-gradient(2px 2px at 40% 20%, #fff, transparent),
                              radial-gradient(1.5px 1.5px at 70% 40%, #fff, transparent),
                              radial-gradient(1.8px 1.8px at 20% 70%, #fff, transparent),
                              radial-gradient(1.2px 1.2px at 80% 80%, #fff, transparent);
            opacity: 0;
            transition: opacity 0.5s ease;
            z-index: 0;
        }
        body.night .stars { opacity: 0.6; }

        /* Fireflies */
        .firefly {
            position: fixed;
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: radial-gradient(circle, #fff176 0%, rgba(255,255,255,0) 70%);
            opacity: 0;
            pointer-events: none;
            animation: fly 12s linear infinite;
            mix-blend-mode: screen;
            z-index: 0;
        }
        @keyframes fly {
            0% { transform: translate(0,0) scale(0.8); opacity: 0; }
            10% { opacity: 1; }
            50% { transform: translate(120px,-80px) scale(1); }
            100% { transform: translate(-60px,100px) scale(0.8); opacity: 0; }
        }

        @media (max-width: 1200px) {
            .main {
                grid-template-columns: 1fr;
            }
        }

        /* Tablet adjustments */
        @media (max-width: 900px) {
            nav { padding: 10px 24px; gap: 12px; }
            nav .menu-btn { display:inline-block; }
            nav .links { gap:16px; }
            .header { padding: 24px; min-height: 200px; }
            .profile-section { flex-direction: column; text-align: center; gap: 18px; }
            .profile-pic { width: 120px; height: 120px; border-radius: 18px; }
            .main { padding: 24px; border-width: 3px; }
            .section { padding: 20px; }
            .section h2 { font-size: 1.3em; }
            .contact-row { flex-wrap: wrap; gap: 12px; }
            .cloud { opacity: 0.85; }
        }

        /* Phone adjustments */
        @media (max-width: 600px) {
            nav { padding: 10px 12px; gap: 8px; }
            nav .links { position: absolute; top: 58px; left: 12px; right: 12px; display:none; flex-direction: column; align-items: stretch; gap: 8px; background: rgba(0,0,0,0.45); backdrop-filter: blur(8px); padding: 10px; border-radius: 12px; box-shadow: 0 10px 24px rgba(0,0,0,0.35); }
            nav .links a { background: rgba(255,255,255,0.08); border-radius: 10px; padding: 10px 12px; }
            nav .links.open { display:flex; }
            .header { padding: 18px; min-height: 180px; }
            .profile-pic { width: 100px; height: 100px; border-radius: 16px; }
            .header-text .subtitle { font-size: 1em; }
            .main { padding: 18px; border-width: 2px; }
            .section { padding: 16px; }
            .section h2 { font-size: 1.15em; }
            .education .year { float: none; display: inline-block; margin-bottom: 6px; }
            .contact-row { flex-direction: column; align-items: flex-start; }
            .contact-links img { width: 32px; height: 32px; }
            #scrollTopBtn { bottom: 18px; right: 18px; width: 48px; height: 48px; font-size: 1.4em; }
            .cloud { width: 120px; height: 46px; }
            .cloud.small { width: 90px; height: 34px; }
            .cloud.xs { width: 68px; height: 26px; }
        }
    </style>
    </head>
    <body>
        <nav role="navigation" aria-label="Main Navigation">
            <button class="menu-btn" id="menuToggle" aria-label="Toggle Menu" aria-expanded="false">☰</button>
            <div class="links" id="navLinks">
                <a href="#home" class="nav-link active">Home</a>
                <a href="#personal" class="nav-link">Personal</a>
                <a href="#skills" class="nav-link">Skills</a>
                <a href="#hobbies" class="nav-link">Hobbies</a>
                <a href="#education" class="nav-link">Education</a>
                <a href="#contact" class="nav-link">Contact</a>
                <button id="nightToggle" style="background:none; border:none; color:#fff; font-size:1.3rem; cursor:pointer; padding:8px; border-radius:8px;" title="Toggle Night Mode">🌙</button>
            </div>
        </nav>
        
        <div class="resume">
            <xsl:apply-templates select="header"/>
            
            <main class="main ground" role="main">
                <xsl:apply-templates select="garden_profile"/>
                <xsl:apply-templates select="abilities"/>
                <xsl:apply-templates select="hobbies"/>
                <xsl:apply-templates select="education"/>
                <section class="section" id="contact" aria-label="Get in Touch" data-icon="📫">
                    <h2>PLANT A MESSAGE FOR THE GARDENER</h2>
                    <div class="contact-row">
                        <form action="https://formspree.io/f/xrbrbybd" method="POST">
                            <label>Your email:</label>
                            <input type="email" name="email"/>
                            <label>Your message:</label>
                            <textarea name="message"></textarea>
                            <button type="submit">Send</button>
                        </form>
                        <div style="flex:1"></div>
                    </div>
                </section>
            </main>
        </div>
        
        <button id="scrollTopBtn" title="Back to Top">⬆</button>
        <div class="stars" aria-hidden="true"></div>
        
        <script>
        const navLinks = document.querySelectorAll("nav a");
        navLinks.forEach(link => {
            link.addEventListener("click", () => {
                navLinks.forEach(l => l.classList.remove("active"));
                link.classList.add("active");
            });
        });

        const scrollTopBtn = document.getElementById("scrollTopBtn");
        const onScroll = () => {
            const y = window.scrollY;
            scrollTopBtn.style.display = y > 300 ? "block" : "none";
            compactNav();
        };
        window.addEventListener("scroll", onScroll, { passive: true });

        scrollTopBtn.addEventListener("click", () => {
            window.scrollTo({ top: 0, behavior: "smooth" });
        });
        
        // Smooth scroll for in-page nav links and scrollspy highlighting
        const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
        const sectionIds = ["home", "personal", "skills", "hobbies", "education", "contact"];
        const sections = sectionIds
            .map(id => document.getElementById(id))
            .filter(Boolean);
        const linkById = new Map(
            Array.from(navLinks)
                .filter(a => a.getAttribute('href') &amp;&amp; a.getAttribute('href').startsWith('#'))
                .map(a => [a.getAttribute('href').slice(1), a])
        );

        // In-page smooth scroll
        navLinks.forEach(a => {
            const href = a.getAttribute('href');
            if (href &amp;&amp; href.startsWith('#')) {
                a.addEventListener('click', (e) => {
                    e.preventDefault();
                    const target = document.querySelector(href);
                    if (!target) return;
                    const behavior = prefersReducedMotion ? 'auto' : 'smooth';
                    target.scrollIntoView({ behavior, block: 'start' });
                });
            }
        });

        // Scrollspy using IntersectionObserver
        let activeId = null;
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const id = entry.target.id;
                    activeId = id;
                    navLinks.forEach(l => l.classList.remove('active'));
                    const link = linkById.get(id);
                    if (link) link.classList.add('active');
                }
            });
        }, { root: null, rootMargin: '0px 0px -60% 0px', threshold: 0.25 });

        sections.forEach(sec => observer.observe(sec));

        // Reveal-on-scroll animations for sections
        const revealTargets = document.querySelectorAll('.section, .education-item');
        revealTargets.forEach(el => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(18px)';
            el.style.transition = 'opacity 500ms ease, transform 500ms ease';
        });
        const revealObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                    revealObserver.unobserve(entry.target);
                }
            });
        }, { threshold: 0.15 });
        revealTargets.forEach(t => revealObserver.observe(t));

        // Dynamic navbar compaction on scroll
        const nav = document.querySelector('nav');
        const compactNav = () => {
            const y = window.scrollY;
            nav.style.boxShadow = y > 20 ? '0 4px 16px rgba(0,0,0,0.25)' : '0 6px 20px rgba(0,0,0,0.25)';
            nav.style.background = y > 20
                ? 'linear-gradient(135deg, rgba(0,153,225,0.92), rgba(76,175,80,0.92))'
                : 'linear-gradient(135deg, rgba(0,153,225,0.95), rgba(76,175,80,0.95))';
        };
        compactNav();

        // Keyboard shortcut: press "t" to scroll to top
        window.addEventListener('keydown', (e) => {
            if ((e.key === 't' || e.key === 'T') &amp;&amp; !e.ctrlKey &amp;&amp; !e.metaKey &amp;&amp; !e.altKey) {
                window.scrollTo({ top: 0, behavior: prefersReducedMotion ? 'auto' : 'smooth' });
            }
        });

        // Click-to-copy for phone and email with toast feedback
        function showToast(message) {
            const toast = document.createElement('div');
            toast.textContent = message;
            toast.style.position = 'fixed';
            toast.style.left = '50%';
            toast.style.bottom = '26px';
            toast.style.transform = 'translateX(-50%)';
            toast.style.background = 'rgba(0,0,0,0.8)';
            toast.style.color = '#fff';
            toast.style.padding = '10px 14px';
            toast.style.borderRadius = '12px';
            toast.style.fontWeight = '800';
            toast.style.boxShadow = '0 6px 14px rgba(0,0,0,0.35)';
            toast.style.zIndex = '2000';
            toast.style.opacity = '0';
            toast.style.transition = 'opacity 250ms ease';
            document.body.appendChild(toast);
            requestAnimationFrame(() => { toast.style.opacity = '1'; });
            setTimeout(() => {
                toast.style.opacity = '0';
                setTimeout(() => toast.remove(), 300);
            }, 1500);
        }

        function attachCopyHandler(selector, valueGetter) {
            const el = document.querySelector(selector);
            if (!el) return;
            el.addEventListener('click', async (e) => {
                // Let normal link behavior proceed on modifier clicks
                if (e.ctrlKey || e.metaKey || e.altKey || e.shiftKey) return;
                e.preventDefault();
                const value = valueGetter();
                try {
                    await navigator.clipboard.writeText(value);
                    showToast('Copied: ' + value);
                } catch (_) {
                    showToast('Copy not supported');
                }
            });
        }

        attachCopyHandler('a[href^="tel:"]', () => '0993-538-7283');
        attachCopyHandler('a[href^="mailto:"]', () => 'atchazoj6@gmail.com');

        // Garden Level progress logic
        const levelFill = document.getElementById('levelFill');
        const badges = document.getElementById('badges');
        const levelPercent = 68; // demo value
        if (levelFill) {
            requestAnimationFrame(() => { levelFill.style.width = levelPercent + '%'; });
        }
        function renderBadges(p) {
            if (!badges) return;
            badges.innerHTML = '';
            const items = [];
            if (p >= 10) items.push('🌰 Seedling');
            if (p >= 40) items.push('🌿 Sprout');
            if (p >= 70) items.push('🌼 Bloom');
            if (p >= 90) items.push('🌻 Sunflower');
            items.forEach(text => {
                const b = document.createElement('span');
                b.className = 'badge';
                b.textContent = text;
                badges.appendChild(b);
            });
        }
        renderBadges(levelPercent);

        // Parallax clouds slight mouse move effect
        const header = document.querySelector('.header');
        const cloudEls = document.querySelectorAll('.cloud');
        if (header &amp;&amp; cloudEls.length) {
            header.addEventListener('mousemove', (e) => {
                const rect = header.getBoundingClientRect();
                const rx = (e.clientX - rect.left) / rect.width - 0.5;
                const ry = (e.clientY - rect.top) / rect.height - 0.5;
                cloudEls.forEach((c, i) => {
                    const depth = (i + 1) * 4;
                    c.style.transform = `translate(${rx * depth}px, ${ry * depth}px)`;
                });
            });
            header.addEventListener('mouseleave', () => {
                cloudEls.forEach((c) => { c.style.transform = 'translate(0,0)'; });
            });
        }

        // Floating leaf particles
        function spawnLeaf() {
            const leaf = document.createElement('div');
            leaf.className = 'leaf';
            leaf.textContent = '🍃';
            leaf.style.position = 'fixed';
            leaf.style.left = Math.random() * 100 + 'vw';
            leaf.style.top = '-20px';
            leaf.style.fontSize = (14 + Math.random() * 12) + 'px';
            leaf.style.opacity = '0.9';
            leaf.style.pointerEvents = 'none';
            leaf.style.transition = 'transform 10s linear, opacity 1s ease';
            document.body.appendChild(leaf);
            const endX = (Math.random() * 40 - 20);
            requestAnimationFrame(() => {
                leaf.style.transform = `translate(${endX}vw, 110vh) rotate(${Math.random()*360}deg)`;
            });
            setTimeout(() => { leaf.style.opacity = '0'; }, 9000);
            setTimeout(() => { leaf.remove(); }, 10500);
        }
        setInterval(spawnLeaf, 3500);

        // Night mode toggle with stars and fireflies
        const nightToggle = document.getElementById('nightToggle');
        function ensureFireflies(count = 8) {
            if (!document.body.classList.contains('night')) return;
            const existing = document.querySelectorAll('.firefly');
            const needed = Math.max(0, count - existing.length);
            for (let i = 0; i &lt; needed; i++) {
                const f = document.createElement('div');
                f.className = 'firefly';
                f.style.left = Math.random() * 100 + 'vw';
                f.style.top = Math.random() * 100 + 'vh';
                f.style.animationDelay = (Math.random() * 12) + 's';
                document.body.appendChild(f);
            }
        }
        if (nightToggle) {
            nightToggle.addEventListener('click', (e) => {
                e.preventDefault();
                document.body.classList.toggle('night');
                if (document.body.classList.contains('night')) {
                    ensureFireflies(10);
                    showToast('Night Garden 🌙');
                } else {
                    document.querySelectorAll('.firefly').forEach(f => f.remove());
                    showToast('Day Garden ☀️');
                }
            });
        }

        // Mobile menu toggle
        const menuBtn = document.getElementById('menuToggle');
        const linksWrap = document.getElementById('navLinks');
        if (menuBtn &amp;&amp; linksWrap) {
            const closeMenu = () => { linksWrap.classList.remove('open'); menuBtn.setAttribute('aria-expanded','false'); };
            menuBtn.addEventListener('click', () => {
                const open = linksWrap.classList.toggle('open');
                menuBtn.setAttribute('aria-expanded', open ? 'true' : 'false');
            });
            document.addEventListener('click', (e) => {
                if (!linksWrap.contains(e.target) &amp;&amp; e.target !== menuBtn) closeMenu();
            });
            window.addEventListener('resize', () => { if (window.innerWidth > 600) closeMenu(); });
            linksWrap.querySelectorAll('a[href^="#"]').forEach(a => a.addEventListener('click', () => closeMenu()));
        }
    </script>
    </body>
    </html>
</xsl:template>

<xsl:template match="header">
    <header class="header" id="home" aria-label="Home">
        <div class="clouds" aria-hidden="true">
            <div class="cloud" style="top:18px; left:-10%; animation-delay:0s"></div>
            <div class="cloud small" style="top:58px; left:-25%; animation-delay:6s"></div>
            <div class="cloud xs" style="top:96px; left:-35%; animation-delay:12s"></div>
        </div>
        <div class="profile-section">
            <img src="images/jake.png" alt="{@name}" class="profile-pic" onerror="this.style.display='none'"/>
            <div class="header-text">
                <h1><xsl:value-of select="@name"/></h1>
                <div class="subtitle contact">
                    📍 <xsl:value-of select="contact/location"/><br/>
                    📱 <a href="tel:{contact/phone}" style="color:inherit; text-decoration:none; font-weight:800;"><xsl:value-of select="contact/phone"/></a> |
                    📧 <a href="mailto:{contact/email}" style="color:inherit; text-decoration:none; font-weight:800;"><xsl:value-of select="contact/email"/></a>
                </div>
            </div>
        </div>
    </header>
</xsl:template>

<xsl:template match="garden_profile">
    <section class="garden-level" aria-label="Garden Level">
        <div style="display:flex; align-items:center; gap:10px; justify-content:space-between;">
            <div style="display:flex; align-items:center; gap:8px; font-weight:800; color:#2f6b2f">
                <span>🌞</span>
                <span>GARDENER PROGRESS</span>
            </div>
            <div class="badges" id="badges"></div>
        </div>
        <div class="level-bar">
            <div class="fill" id="levelFill" style="width: {@level}%;"></div>
        </div>
    </section>
    
    <section class="section personal-data" id="personal" data-icon="🌱">
        <h2>GARDENER PROFILE</h2>
        <ul>
            <xsl:for-each select="info">
                <li>
                    <xsl:choose>
                        <xsl:when test="@key = 'Born'">👤</xsl:when>
                        <xsl:when test="@key = 'Citizenship'">🇵🇭</xsl:when>
                        <xsl:when test="@key = 'Status'">✨</xsl:when>
                        <xsl:when test="@key = 'Height'">📏</xsl:when>
                        <xsl:when test="@key = 'Weight'">⚖️</xsl:when>
                        <xsl:when test="@key = 'Religion'">⛪</xsl:when>
                        <xsl:when test="@key = 'Languages'">🗣️</xsl:when>
                        <xsl:otherwise>*</xsl:otherwise>
                    </xsl:choose>
                    <strong><xsl:value-of select="@key"/>:</strong> <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
    </section>
</xsl:template>

<xsl:template match="abilities">
    <section class="section skills" id="skills" data-icon="🧰">
        <xsl:for-each select="section">
            <xsl:if test="position() &gt; 1">
                <h2 style="margin-top:22px;"><xsl:value-of select="@title"/></h2>
            </xsl:if>
            <xsl:if test="position() = 1">
                <h2><xsl:value-of select="@title"/></h2>
            </xsl:if>
            <ul>
                <xsl:for-each select="ability">
                    <li><xsl:value-of select="."/></li>
                </xsl:for-each>
            </ul>
        </xsl:for-each>
    </section>
</xsl:template>

<xsl:template match="hobbies">
    <section class="section hobbies" id="hobbies" data-icon="🌸">
        <h2><xsl:value-of select="@title"/></h2>
        <ul>
            <xsl:for-each select="activity">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>
        </ul>
    </section>
</xsl:template>

<xsl:template match="education">
    <section class="section education-full" id="education" data-icon="🌿">
        <h2><xsl:value-of select="@title"/></h2>
        <ul>
            <xsl:for-each select="period">
                <li class="education-item">
                    <span class="year"><xsl:value-of select="@year_start"/> - <xsl:value-of select="@year_end"/></span>
                    <div class="school-name"><xsl:value-of select="@type"/></div>
                    <div class="school-location">
                        🏫 <xsl:value-of select="school/@name"/><br/>
                        <xsl:value-of select="school/@location"/>
                    </div>
                </li>
            </xsl:for-each>
        </ul>
    </section>
</xsl:template>

</xsl:stylesheet>