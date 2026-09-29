<!DOCTYPE html>
<html lang="ko" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>링키지 Linkage — 나만의 링크 도서관</title>
  <meta name="description" content="흩어진 링크를 카테고리 폴더로 정리하고 한 줄 메모를 남기는 개인 링크 아카이브, 링키지." />

  <!-- Google Fonts: Bricolage Grotesque & IBM Plex Sans KR -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,600;12..96,800&family=IBM+Plex+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet" />

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      darkMode: 'class',
      theme: {
        extend: {
          fontFamily: {
            sans: ['"IBM Plex Sans KR"', 'sans-serif'],
            display: ['"Bricolage Grotesque"', '"IBM Plex Sans KR"', 'sans-serif'],
          },
          colors: {
            background: 'oklch(0.17 0.049 291)',
            foreground: 'oklch(0.985 0 0)',
            primary: {
              DEFAULT: 'oklch(0.75 0.14 221)',
              foreground: 'oklch(0.17 0.049 291)',
            },
            accent: 'oklch(0.69 0.22 309)',
            warm: 'oklch(0.79 0.16 33)',
            surface: 'oklch(0.85 0.08 290 / 8%)',
            'surface-strong': 'oklch(0.85 0.08 290 / 14%)',
            'surface-border': 'oklch(0.85 0.08 290 / 18%)',
            paper: 'oklch(0.975 0 0)',
            'paper-foreground': 'oklch(0.22 0.03 285)',
            'ink-muted': 'oklch(0.42 0.02 285)',
          }
        }
      }
    }
  </script>
  <style>
    body {
      background-color: oklch(0.17 0.049 291);
      color: oklch(0.985 0 0);
      font-family: "IBM Plex Sans KR", sans-serif;
    }
    html {
      scroll-behavior: smooth;
    }
  </style>
</head>
<body class="min-h-screen bg-background text-foreground overflow-x-hidden selection:bg-primary/30">

  <!-- Header -->
  <header class="relative z-10 flex items-center justify-between max-w-6xl mx-auto px-6 py-5">
    <div class="flex items-center gap-3">
      <!-- 링키지 로고 이미지 -->
      <img 
        src="data:image/jpeg;base64,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" 
        alt="링키지 로고" 
        class="w-9 h-9 rounded-lg object-cover ring-1 ring-surface-border shadow-sm"
      />
      <span class="font-display font-extrabold text-lg tracking-tight">
        링키지 <span class="text-primary">Linkage</span>
      </span>
    </div>
    <nav class="hidden md:flex items-center gap-7 text-sm text-white/70">
      <a href="#how" class="hover:text-white transition-colors">만드는 법</a>
      <a href="#features" class="hover:text-white transition-colors">기능</a>
      <a href="#picks" class="hover:text-white transition-colors">오늘의 발견</a>
    </nav>
    <a
      href="https://uc1306-spec.github.io/akaive/"
      target="_blank"
      rel="noopener noreferrer"
      class="rounded-lg bg-primary text-primary-foreground text-sm font-semibold py-2 px-4 ring-1 ring-primary/40 hover:bg-primary/90 transition-all shadow-sm"
    >
      앱 열기
    </a>
  </header>

  <!-- Hero Section -->
  <section class="relative z-10 max-w-6xl mx-auto px-6 pt-8 pb-16 grid lg:grid-cols-[1.05fr_.95fr] gap-12 items-center">
    <div>
      <div class="inline-flex items-center gap-2 rounded-full bg-surface ring-1 ring-surface-border px-3.5 py-1.5 text-xs text-white/80 backdrop-blur-md">
        <span class="w-2 h-2 rounded-full bg-primary animate-pulse"></span>
        나만의 링크 도서관
      </div>
      <h1 class="font-display font-extrabold text-balance mt-5 leading-[1.05] text-5xl sm:text-6xl lg:text-7xl max-w-[15ch]">
        흩어진 링크를 <span class="text-primary">한 곳</span>에 모아봄
      </h1>
      <p class="mt-5 text-white/75 text-lg leading-relaxed max-w-[46ch]">
        구독·업무·재미로 흩어진 URL을 카테고리 폴더로 정리하고, 한 줄 메모를 붙여두세요. 큐레이터가 고른 오늘의 발견까지 한 화면에서.
      </p>
      <div class="mt-8 flex flex-wrap items-center gap-3">
        <a
          href="https://uc1306-spec.github.io/akaive/"
          target="_blank"
          rel="noopener noreferrer"
          class="inline-block rounded-lg bg-primary text-primary-foreground text-sm font-semibold py-2.5 px-6 ring-1 ring-primary/40 hover:bg-primary/90 transition-all shadow-md"
        >
          링키지 시작하기
        </a>
        <a
          href="#how"
          class="inline-block rounded-lg bg-surface text-foreground text-sm font-medium py-2.5 px-5 ring-1 ring-surface-border hover:bg-surface-strong transition-all backdrop-blur-md"
        >
          만드는 법 보기
        </a>
      </div>
      <div class="mt-7 flex items-center gap-3 text-xs text-white/60">
        <div class="flex -space-x-2">
          <div class="w-6 h-6 rounded-full bg-primary/70 ring-2 ring-background"></div>
          <div class="w-6 h-6 rounded-full bg-accent/70 ring-2 ring-background"></div>
          <div class="w-6 h-6 rounded-full bg-warm/80 ring-2 ring-background"></div>
        </div>
        이미 12,400개의 링크가 정리됨
      </div>
    </div>

    <!-- App Mockup UI -->
    <div class="relative">
      <div class="absolute -inset-4 rounded-[2.5rem] bg-gradient-to-tr from-primary/20 via-warm/15 to-accent/25 blur-3xl pointer-events-none"></div>
      <div class="relative rounded-[1.5rem] bg-surface-strong ring-1 ring-surface-border backdrop-blur-2xl p-3 shadow-2xl">
        <div class="rounded-[1rem] bg-paper text-paper-foreground overflow-hidden shadow-inner">
          <div class="flex items-center gap-2 px-4 py-3 border-b border-black/5 bg-black/[0.02]">
            <span class="w-3 h-3 rounded-full bg-warm"></span>
            <span class="w-3 h-3 rounded-full bg-accent"></span>
            <span class="w-3 h-3 rounded-full bg-primary"></span>
            <div class="ml-3 flex-1 rounded-md bg-black/5 px-3 py-1.5 text-xs text-ink-muted">
              akaive · 나만의 링크 도서관
            </div>
          </div>
          <div class="grid grid-cols-[128px_1fr]">
            <aside class="border-r border-black/5 p-3 space-y-1.5 text-xs">
              <div class="rounded-md bg-primary/15 px-2.5 py-1.5 font-semibold text-paper-foreground">
                📁 업무
              </div>
              <div class="rounded-md px-2.5 py-1.5 text-ink-muted hover:bg-black/5 transition-colors cursor-pointer">
                📁 영감
              </div>
              <div class="rounded-md px-2.5 py-1.5 text-ink-muted hover:bg-black/5 transition-colors cursor-pointer">
                📁 구독
              </div>
              <div class="rounded-md px-2.5 py-1.5 text-ink-muted hover:bg-black/5 transition-colors cursor-pointer">
                📁 쇼핑
              </div>
            </aside>
            <div class="p-3 space-y-2">
              <div class="rounded-lg bg-black/[0.03] ring-1 ring-black/5 p-3">
                <div class="flex items-center gap-2">
                  <div class="w-5 h-5 rounded bg-warm/25 grid place-items-center text-[9px] font-bold text-paper-foreground">
                    Y
                  </div>
                  <span class="text-xs font-semibold text-paper-foreground">
                    유튜브 · 학습 플레이리스트
                  </span>
                  <span class="ml-auto text-[10px] rounded-full bg-accent/15 text-paper-foreground px-2 py-0.5">
                    업무
                  </span>
                </div>
                <p class="mt-1.5 text-[11px] text-ink-muted">
                  한 줄 메모: 목요일 밤에 몰아보기
                </p>
              </div>
              <div class="rounded-lg bg-black/[0.03] ring-1 ring-black/5 p-3">
                <div class="flex items-center gap-2">
                  <div class="w-5 h-5 rounded bg-primary/20 grid place-items-center text-[9px] font-bold text-paper-foreground">
                    N
                  </div>
                  <span class="text-xs font-semibold text-paper-foreground">
                    네이버 · 카페 공지 모음
                  </span>
                  <span class="ml-auto text-[10px] rounded-full bg-accent/15 text-paper-foreground px-2 py-0.5">
                    구독
                  </span>
                </div>
                <p class="mt-1.5 text-[11px] text-ink-muted">
                  한 줄 메모: 이번 달 마감 확인용
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 3 Steps Section -->
  <section id="how" class="relative z-10 max-w-6xl mx-auto px-6 py-12">
    <h2 class="font-display font-semibold text-3xl sm:text-4xl leading-tight">
      세 걸음이면 끝
    </h2>
    <div class="mt-8 grid md:grid-cols-3 gap-5">
      <div class="rounded-2xl bg-surface ring-1 ring-surface-border backdrop-blur-xl p-7 transition-all hover:bg-surface-strong">
        <span class="font-display font-extrabold text-5xl bg-clip-text text-transparent bg-gradient-to-br from-primary to-primary/40">01</span>
        <h3 class="mt-3 font-semibold text-lg text-primary">로그인</h3>
        <p class="mt-2 text-sm text-white/75 leading-relaxed">
          구글 또는 이메일로 <span class="text-primary font-medium">5초 만에</span> 시작합니다. 별도 가입 절차가 없어요.
        </p>
      </div>
      <div class="rounded-2xl bg-surface-strong ring-1 ring-surface-border backdrop-blur-xl p-7 md:mt-6 transition-all">
        <span class="font-display font-extrabold text-5xl bg-clip-text text-transparent bg-gradient-to-br from-accent to-accent/40">02</span>
        <h3 class="mt-3 font-semibold text-lg text-accent">카테고리 설정</h3>
        <p class="mt-2 text-sm text-white/75 leading-relaxed">
          나만의 <span class="text-accent font-medium">폴더</span>를 만들고 순서와 이름을 직관적으로 정리합니다.
        </p>
      </div>
      <div class="rounded-2xl bg-surface ring-1 ring-surface-border backdrop-blur-xl p-7 transition-all hover:bg-surface-strong">
        <span class="font-display font-extrabold text-5xl bg-clip-text text-transparent bg-gradient-to-br from-warm to-warm/40">03</span>
        <h3 class="mt-3 font-semibold text-lg text-warm">링크 추가</h3>
        <p class="mt-2 text-sm text-white/75 leading-relaxed">
          URL을 붙여넣고 <span class="text-warm font-medium">한 줄 메모</span>만 남기면 자동 저장됩니다.
        </p>
      </div>
    </div>
  </section>

  <!-- Features Section -->
  <section id="features" class="relative z-10 max-w-6xl mx-auto px-6 py-10">
    <div class="grid lg:grid-cols-3 gap-5">
      <div id="picks" class="lg:col-span-2 rounded-2xl bg-gradient-to-br from-primary/15 to-accent/10 ring-1 ring-surface-border backdrop-blur-xl p-8">
        <h3 class="font-display font-semibold text-xl text-white flex items-center gap-2">
          오늘의 발견 
          <span class="text-[11px] font-normal px-2 py-0.5 rounded-full bg-primary/20 text-primary">Editor's Pick</span>
        </h3>
        <p class="mt-2 text-sm text-white/80 max-w-[42ch] leading-relaxed">
          운영자가 직접 고른 <span class="text-primary font-semibold">엄선된 사이트</span>만 모은 큐레이션 피드. 매일 새로운 추천이 채워집니다.
        </p>
        <div class="mt-6 grid sm:grid-cols-2 gap-3">
          <div class="rounded-xl bg-paper text-paper-foreground p-3.5 ring-1 ring-black/5 shadow-sm">
            <div class="flex items-center gap-2">
              <div class="w-5 h-5 rounded bg-primary/20 grid place-items-center text-[9px] font-bold text-primary">
                주
              </div>
              <span class="text-xs font-bold text-paper-foreground">주택청약 캘린더</span>
            </div>
            <p class="mt-1 text-[11px] text-ink-muted">공급 일정 한눈에 확인하기</p>
          </div>
          <div class="rounded-xl bg-paper text-paper-foreground p-3.5 ring-1 ring-black/5 shadow-sm">
            <div class="flex items-center gap-2">
              <div class="w-5 h-5 rounded bg-accent/20 grid place-items-center text-[9px] font-bold text-accent">
                블
              </div>
              <span class="text-xs font-bold text-paper-foreground">롱블랙 데일리</span>
            </div>
            <p class="mt-1 text-[11px] text-ink-muted">하루 한 편 깊이 있는 아티클</p>
          </div>
        </div>
      </div>
      <div class="rounded-2xl bg-surface ring-1 ring-surface-border backdrop-blur-xl p-8 flex flex-col justify-center">
        <h3 class="font-display font-semibold text-xl text-white">
          한 줄 <span class="text-accent underline decoration-accent/40 underline-offset-4">메모</span>
        </h3>
        <p class="mt-2 text-sm text-white/80 leading-relaxed">
          링크마다 <span class="text-accent font-semibold">짧은 메모</span>를 붙여, 나중에 다시 열어볼 목적을 남겨두세요.
        </p>
      </div>
    </div>

    <div class="grid sm:grid-cols-3 gap-5 mt-5">
      <div class="rounded-2xl bg-surface ring-1 ring-surface-border backdrop-blur-xl p-6">
        <h3 class="font-semibold text-base text-white flex items-center gap-2">
          <span class="w-2 h-2 rounded-full bg-primary"></span>
          클라우드 동기화
        </h3>
        <p class="mt-2 text-sm text-white/70 leading-relaxed">
          모바일, 태블릿, PC 어디서 로그인해도 항상 <span class="text-white font-medium">같은 폴더</span>가 유지됩니다.
        </p>
      </div>
      <div class="rounded-2xl bg-surface ring-1 ring-surface-border backdrop-blur-xl p-6">
        <h3 class="font-semibold text-base text-white flex items-center gap-2">
          <span class="w-2 h-2 rounded-full bg-accent"></span>
          공유 링크
        </h3>
        <p class="mt-2 text-sm text-white/70 leading-relaxed">
          동료나 친구에게 폴더를 <span class="text-white font-medium">링크 하나</span>로 손쉽게 공유할 수 있습니다.
        </p>
      </div>
      <div class="rounded-2xl bg-surface ring-1 ring-surface-border backdrop-blur-xl p-6">
        <h3 class="font-semibold text-base text-white flex items-center gap-2">
          <span class="w-2 h-2 rounded-full bg-warm"></span>
          카테고리 폴더
        </h3>
        <p class="mt-2 text-sm text-white/70 leading-relaxed">
          원하는 주제별로 <span class="text-white font-medium">무제한 폴더</span>를 생성해 깔끔하게 분류하세요.
        </p>
      </div>
    </div>
  </section>

  <!-- FAQ Section -->
  <section class="relative z-10 max-w-4xl mx-auto px-6 py-12">
    <div class="text-center mb-8">
      <span class="text-xs font-semibold text-primary uppercase tracking-wider">FAQ</span>
      <h2 class="font-display font-bold text-3xl sm:text-4xl mt-2 text-white">
        자주 묻는 질문
      </h2>
    </div>
    
    <div class="space-y-4">
      <div class="rounded-2xl bg-surface ring-1 ring-surface-border backdrop-blur-xl p-6">
        <h3 class="font-semibold text-base text-white">Q. 이용 요금이 별도로 부과되나요?</h3>
        <p class="mt-2 text-sm text-white/70 leading-relaxed">
          아니요! 링키지는 개인 사용자를 위한 기본 기능을 완전 무료로 제공하고 있습니다. 언제든 부담 없이 시작해 보세요.
        </p>
      </div>
      <div class="rounded-2xl bg-surface ring-1 ring-surface-border backdrop-blur-xl p-6">
        <h3 class="font-semibold text-base text-white">Q. 다른 기기나 브라우저와도 실시간으로 동기화되나요?</h3>
        <p class="mt-2 text-sm text-white/70 leading-relaxed">
          네, 웹 표준 기반으로 제작되어 PC, 태블릿, 스마트폰 등 기기에 구애받지 않고 웹 브라우저에서 쾌적하게 접속할 수 있습니다.
        </p>
      </div>
      <div class="rounded-2xl bg-surface ring-1 ring-surface-border backdrop-blur-xl p-6">
        <h3 class="font-semibold text-base text-white">Q. 저장한 링크나 메모를 다른 사람에게 공유할 수 있나요?</h3>
        <p class="mt-2 text-sm text-white/70 leading-relaxed">
          폴더 단위로 공유 링크를 생성하여 친구나 동료에게 읽기 전용으로 깔끔하게 공유할 수 있는 기능을 지원합니다.
        </p>
      </div>
    </div>
  </section>

  <!-- Final CTA -->
  <section class="relative z-10 max-w-6xl mx-auto px-6 py-12">
    <div class="rounded-[2rem] bg-gradient-to-tr from-primary/20 via-warm/15 to-accent/25 ring-1 ring-surface-border backdrop-blur-2xl p-10 sm:p-14 text-center shadow-2xl">
      <h2 class="font-display font-extrabold text-3xl sm:text-5xl leading-tight max-w-[22ch] mx-auto text-white break-keep">
        오늘부터, 링크가 사라지지 않게
      </h2>
      <p class="mt-4 text-white/75 max-w-[42ch] mx-auto leading-relaxed break-keep">
        무료로 시작해 보세요. 구글 로그인만으로 1분 안에 첫 폴더가 만들어집니다.
      </p>
      <a
        href="https://uc1306-spec.github.io/akaive/"
        target="_blank"
        rel="noopener noreferrer"
        class="inline-block mt-8 rounded-lg bg-primary text-primary-foreground text-sm font-semibold py-3 px-8 ring-1 ring-primary/40 hover:bg-primary/90 transition-all shadow-lg"
      >
        링키지 열기
      </a>
    </div>
  </section>

  <!-- Footer -->
  <footer class="relative z-10 max-w-6xl mx-auto px-6 py-8 flex flex-col sm:flex-row items-center justify-between gap-4 border-t border-surface-border text-sm text-white/60">
    <span>링키지 Linkage · 나만의 링크 도서관</span>
    <span>© 2026 akaive</span>
  </footer>

</body>
</html>
