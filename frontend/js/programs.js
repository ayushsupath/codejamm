// Programs Listing Logic
let allPrograms = [];
let filteredPrograms = [];
let currentFilter = 'all';

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    loadPrograms();
    setupEventListeners();
});

function setupEventListeners() {
    // Search input handler
    const searchInput = document.getElementById('search-input');
    if (searchInput) {
        // Debounce search input
        let searchTimeout;
        searchInput.addEventListener('input', (e) => {
            clearTimeout(searchTimeout);
            searchTimeout = setTimeout(() => {
                searchPrograms(e.target.value.trim());
            }, 300);
        });
    }

    // Difficulty filter buttons
    const filterButtons = document.querySelectorAll('.filter-btn');
    filterButtons.forEach(btn => {
        btn.addEventListener('click', (e) => {
            // Remove active class from all
            filterButtons.forEach(b => b.classList.remove('active'));
            // Add active class to clicked
            e.target.classList.add('active');
            
            // Apply filter
            currentFilter = e.target.getAttribute('data-difficulty');
            
            // If we have an active search, preserve it
            const currentSearch = document.getElementById('search-input').value.trim();
            if (currentSearch) {
                searchPrograms(currentSearch);
            } else {
                applyDifficultyFilter(currentFilter);
            }
        });
    });

    // Clear filters button
    const clearFiltersBtn = document.getElementById('clear-filters-btn');
    if (clearFiltersBtn) {
        clearFiltersBtn.addEventListener('click', () => {
            if (searchInput) searchInput.value = '';
            
            // Reset visual state of buttons
            const filterBtns = document.querySelectorAll('.filter-btn');
            filterBtns.forEach(b => b.classList.remove('active'));
            document.querySelector('.filter-btn[data-difficulty="all"]').classList.add('active');
            
            currentFilter = 'all';
            filteredPrograms = [...allPrograms];
            renderProgramCards(filteredPrograms);
        });
    }

    // Mobile menu toggle
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
}

async function loadPrograms() {
    const container = document.getElementById('programs-container');
    const loadState = document.getElementById('programs-loading');
    const errorState = document.getElementById('programs-error');
    const emptyState = document.getElementById('programs-empty');
    
    // Reset states
    container.innerHTML = '';
    container.appendChild(loadState);
    loadState.style.display = 'block';
    errorState.style.display = 'none';
    emptyState.style.display = 'none';
    document.getElementById('results-count').textContent = 'Loading';

    try {
        // We'll fetch from API soon, but currently backend might not have this endpoint aggregated. 
        // We'll fetch all programs based on getting difficulties separately if a master endpoint doesn't exist,
        // but since we need all of them to filter client side quickly, let's fetch all 3 difficulties.
        
        const [easy, moderate, advanced] = await Promise.all([
            getProgramsByDifficulty('EASY').catch(() => []),
            getProgramsByDifficulty('MODERATE').catch(() => []),
            getProgramsByDifficulty('ADVANCED').catch(() => [])
        ]);
        
        // Combine all arrays
        allPrograms = [...easy, ...moderate, ...advanced];
        
        // Remove duplicates if any (based on program ID)
        const uniqueProgramsMap = new Map();
        allPrograms.forEach(p => uniqueProgramsMap.set(p.id, p));
        allPrograms = Array.from(uniqueProgramsMap.values());
        
        // Check URL for initial difficulty filter
        const urlParams = new URLSearchParams(window.location.search);
        const urlDifficulty = urlParams.get('difficulty')?.toUpperCase();
        
        if (urlDifficulty && ['EASY', 'MODERATE', 'ADVANCED'].includes(urlDifficulty)) {
            currentFilter = urlDifficulty;
            // Update button UI
            document.querySelectorAll('.filter-btn').forEach(btn => {
                btn.classList.remove('active');
                if (btn.getAttribute('data-difficulty') === urlDifficulty) {
                    btn.classList.add('active');
                }
            });
            filteredPrograms = allPrograms.filter(p => p.difficultyLevel === currentFilter);
        } else {
            filteredPrograms = [...allPrograms];
        }
        
        renderProgramCards(filteredPrograms);
    } catch (error) {
        console.error('Error loading programs:', error);
        loadState.style.display = 'none';
        errorState.style.display = 'block';
        document.getElementById('results-count').textContent = '0';
    }
}

async function searchPrograms(keyword) {
    if (!keyword) {
        applyDifficultyFilter(currentFilter);
        return;
    }

    // Try server-side search first (better for potential pagination in future)
    try {
        const searchResults = await window.searchPrograms(keyword);
        
        // Re-apply difficulty filter manually if needed because search endpoint ignores difficulty
        if (currentFilter !== 'all') {
            filteredPrograms = searchResults.filter(p => p.difficultyLevel === currentFilter);
        } else {
            filteredPrograms = searchResults;
        }
        
        renderProgramCards(filteredPrograms);
    } catch (e) {
        console.log("Server search failed, falling back to local search", e);
        // Fallback to local search
        const lowerKeyword = keyword.toLowerCase();
        let baseList = currentFilter === 'all' 
            ? allPrograms 
            : allPrograms.filter(p => p.difficultyLevel === currentFilter);
            
        filteredPrograms = baseList.filter(p => 
            p.title.toLowerCase().includes(lowerKeyword) || 
            (p.description && p.description.toLowerCase().includes(lowerKeyword)) ||
            (p.tags && p.tags.toLowerCase().includes(lowerKeyword))
        );
        
        renderProgramCards(filteredPrograms);
    }
}

function applyDifficultyFilter(level) {
    if (level === 'all') {
        filteredPrograms = [...allPrograms];
    } else {
        filteredPrograms = allPrograms.filter(p => p.difficultyLevel === level);
    }
    
    renderProgramCards(filteredPrograms);
}

function renderProgramCards(programs) {
    const container = document.getElementById('programs-container');
    const emptyState = document.getElementById('programs-empty');
    
    // Update count
    document.getElementById('results-count').textContent = programs.length;
    
    // Clear container completely
    container.innerHTML = '';
    
    if (programs.length === 0) {
        emptyState.style.display = 'block';
        return;
    }
    
    emptyState.style.display = 'none';
    
    programs.forEach(program => {
        const card = createProgramCard(program);
        container.appendChild(card);
    });
}

function createProgramCard(program) {
    const div = document.createElement('div');
    div.className = 'program-card';
    
    // Use fallback for view counts if backend returns null
    const views = program.viewCount || 0;
    const likes = program.likesCount || 0;
    
    div.innerHTML = `
        <div class="program-header">
            <h3>${program.title}</h3>
            <span class="program-badge badge-${program.difficultyLevel.toLowerCase()}">${program.difficultyLevel}</span>
        </div>
        <p>${program.description || 'No description available for this program.'}</p>
        <div class="program-footer">
            <span title="Views"><i class="fas fa-eye"></i> ${views}</span>
            <span title="Likes"><i class="fas fa-heart" style="color: #ef4444;"></i> ${likes}</span>
        </div>
    `;
    
    div.addEventListener('click', () => navigateToDetail(program.id));
    
    return div;
}

function navigateToDetail(programId) {
    window.location.href = `program-detail.html?id=${programId}`;
}
