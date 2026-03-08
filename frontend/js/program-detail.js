// Program Detail Page Logic

let programData = null;
let currentProgramId = null;

document.addEventListener('DOMContentLoaded', () => {
    // Mobile toggle setup
    const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
    if (mobileMenuToggle) {
        mobileMenuToggle.addEventListener('click', () => {
            const navMenu = document.querySelector('.nav-menu');
            navMenu.style.display = navMenu.style.display === 'flex' ? 'none' : 'flex';
            navMenu.style.flexDirection = 'column';
            navMenu.style.position = 'absolute';
            navMenu.style.top = '100%';
            navMenu.style.left = '0';
            navMenu.style.width = '100%';
            navMenu.style.backgroundColor = 'var(--card-bg)';
            navMenu.style.padding = '1rem 0';
            navMenu.style.boxShadow = 'var(--shadow-md)';
            
            const listItems = navMenu.querySelectorAll('li');
            listItems.forEach(li => {
                li.style.textAlign = 'center';
                li.style.margin = '0.5rem 0';
            });
        });
    }

    currentProgramId = getProgramIdFromUrl();
    
    if (!currentProgramId) {
        showError('Invalid URL', 'No program ID was provided in the link.');
        return;
    }
    
    loadProgramDetails(currentProgramId);
    setupActionListeners();
});

function getProgramIdFromUrl() {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get('id');
}

async function loadProgramDetails(id) {
    try {
        // Increment view count in background
        incrementViewCount(id).catch(e => console.warn('Could not increment view count', e));
        
        // Fetch actual data
        programData = await getProgramById(id);
        
        if (!programData) {
            throw new Error('Program not found');
        }
        
        displayProgramDetails(programData);
        
    } catch (error) {
        console.error('Error fetching program:', error);
        showError('Program not found', 'The program you are looking for does not exist or was removed.');
    }
}

function displayProgramDetails(program) {
    // Hide loader, show content
    document.getElementById('loading-indicator').style.display = 'none';
    document.getElementById('detail-content').style.display = 'block';

    // Populate Breadcrumb
    document.getElementById('program-title-breadcrumb').textContent = program.title;
    
    // Populate Header
    document.getElementById('program-title').textContent = program.title;
    document.getElementById('program-desc').textContent = program.description || '';

    // Populate Metadata
    const diffBadge = document.getElementById('difficulty-badge');
    diffBadge.textContent = program.difficultyLevel;
    diffBadge.className = `program-badge badge-${program.difficultyLevel.toLowerCase()}`;
    
    document.getElementById('time-complexity').textContent = program.timeComplexity || 'N/A';
    document.getElementById('space-complexity').textContent = program.spaceComplexity || 'N/A';
    
    // API returns updated view count implicitly via get endpoint, but if not we show what it loaded
    const views = program.viewCount || 0;
    document.getElementById('view-count').textContent = views;

    const likes = program.likesCount || 0;
    document.getElementById('like-count').textContent = likes;

    // Optional explanation content
    if (program.explanation) {
        const explContainer = document.getElementById('explanation-container');
        document.getElementById('program-explanation').innerHTML = program.explanation.replace(/\\n/g, '<br/>');
        explContainer.style.display = 'block';
    }

    // Populate Code Container
    const codeEl = document.getElementById('program-code');
    codeEl.textContent = program.code || '// No code provided';

    // Highlight code
    if (window.Prism) {
        Prism.highlightElement(codeEl);
    }
}

function setupActionListeners() {
    // Copy Code Button
    const copyBtn = document.getElementById('copy-code-btn');
    if (copyBtn) {
        copyBtn.addEventListener('click', copyCodeToClipboard);
    }

    // Run in Compiler Button
    const runBtn = document.getElementById('run-in-compiler-btn');
    if (runBtn) {
        runBtn.addEventListener('click', runInCompiler);
    }

    // Like Button
    const likeBtn = document.getElementById('like-btn');
    if (likeBtn) {
        likeBtn.addEventListener('click', () => handleLikeClick(currentProgramId));
    }
}

async function handleLikeClick(id) {
    const likeBtn = document.getElementById('like-btn');
    const likeIcon = document.getElementById('like-icon');
    const likeText = document.getElementById('like-text');
    const likeCount = document.getElementById('like-count');

    // Prevent double clicking quickly
    if (likeBtn.disabled) return;
    likeBtn.disabled = true;

    try {
        const result = await incrementLikesCount(id);
        
        // Update UI depending on what the backend returns. 
        // If it doesn't return the new count, we manually increment what we have
        const newCount = result?.likesCount || (parseInt(likeCount.textContent) + 1);
        likeCount.textContent = newCount;

        // Visual feedback
        likeIcon.style.color = '#ef4444'; // Red color
        likeText.textContent = 'Liked';
        
    } catch (e) {
        console.error('Error liking program:', e);
        // Reset disabled state if failed
        likeBtn.disabled = false;
    }
}

function copyCodeToClipboard() {
    if (!programData || !programData.code) return;
    
    navigator.clipboard.writeText(programData.code).then(() => {
        const btn = document.getElementById('copy-code-btn');
        const originalHTML = btn.innerHTML;
        btn.innerHTML = '<i class="fas fa-check"></i> Copied!';
        // Reset after 2s
        setTimeout(() => {
            btn.innerHTML = originalHTML;
        }, 2000);
    }).catch(err => {
        console.error('Clipboard error:', err);
    });
}

function runInCompiler() {
    if (!programData || !programData.code) return;
    
    // Store code in sessionStorage
    sessionStorage.setItem('codejamm_run_code', programData.code);
    
    // Redirect to compiler
    window.location.href = 'compiler.html';
}

function showError(title, desc) {
    document.getElementById('loading-indicator').style.display = 'none';
    document.getElementById('detail-content').style.display = 'none';
    
    const errObj = document.getElementById('error-message');
    document.getElementById('error-title').textContent = title;
    document.getElementById('error-desc').textContent = desc;
    errObj.style.display = 'block';
}
