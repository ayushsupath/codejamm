// API Helper Functions

/**
 * Generic fetch wrapper with error handling
 */
async function apiRequest(url, options = {}) {
    try {
        const response = await fetch(url, {
            headers: {
                'Content-Type': 'application/json',
                ...options.headers
            },
            ...options
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        return await response.json();
    } catch (error) {
        console.error('API Request Error:', error);
        throw error;
    }
}

/**
 * Get all categories
 */
async function getCategories() {
    return apiRequest(getApiUrl(API_CONFIG.ENDPOINTS.CATEGORIES));
}

/**
 * Get category by ID
 */
async function getCategoryById(id) {
    return apiRequest(getApiUrl(`${API_CONFIG.ENDPOINTS.CATEGORIES}/${id}`));
}

/**
 * Get programs by topic
 */
async function getProgramsByTopic(topicId) {
    return apiRequest(getApiUrl(`${API_CONFIG.ENDPOINTS.PROGRAMS}/topic/${topicId}`));
}

/**
 * Get programs by difficulty
 */
async function getProgramsByDifficulty(level) {
    return apiRequest(getApiUrl(`${API_CONFIG.ENDPOINTS.PROGRAMS}/difficulty/${level}`));
}

/**
 * Get program by ID
 */
async function getProgramById(id) {
    return apiRequest(getApiUrl(`${API_CONFIG.ENDPOINTS.PROGRAMS}/${id}`));
}

/**
 * Search programs
 */
async function searchPrograms(keyword) {
    return apiRequest(getApiUrl(`${API_CONFIG.ENDPOINTS.PROGRAMS}/search?keyword=${encodeURIComponent(keyword)}`));
}

/**
 * Get most viewed programs
 */
async function getMostViewedPrograms() {
    return apiRequest(getApiUrl(`${API_CONFIG.ENDPOINTS.PROGRAMS}/most-viewed`));
}

/**
 * Get most liked programs
 */
async function getMostLikedPrograms() {
    return apiRequest(getApiUrl(`${API_CONFIG.ENDPOINTS.PROGRAMS}/most-liked`));
}

/**
 * Compile and execute Java code
 */
async function compileAndExecute(code, input = '') {
    return apiRequest(getApiUrl(API_CONFIG.ENDPOINTS.COMPILER), {
        method: 'POST',
        body: JSON.stringify({ code, input })
    });
}

/**
 * Increment program view count
 */
async function incrementViewCount(programId) {
    return apiRequest(getApiUrl(`${API_CONFIG.ENDPOINTS.PROGRAMS}/${programId}/view`), {
        method: 'POST'
    });
}

/**
 * Increment program likes count
 */
async function incrementLikesCount(programId) {
    return apiRequest(getApiUrl(`${API_CONFIG.ENDPOINTS.PROGRAMS}/${programId}/like`), {
        method: 'POST'
    });
}

/**
 * Get total programs count
 */
async function getTotalProgramsCount() {
    return apiRequest(getApiUrl(`${API_CONFIG.ENDPOINTS.PROGRAMS}/count`));
}

/**
 * Get total categories count
 */
async function getTotalCategoriesCount() {
    return apiRequest(getApiUrl(`${API_CONFIG.ENDPOINTS.CATEGORIES}/count`));
}
// Mobile menu toggle
document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
    if (mobileMenuToggle) {
        mobileMenuToggle.addEventListener('click', function() {
            document.querySelector('.nav-menu').classList.toggle('active');
        });
    }

    // Mobile dropdown toggle
    document.querySelectorAll('.dropdown-toggle').forEach(toggle => {
        toggle.addEventListener('click', function(e) {
            if (window.innerWidth <= 768) {
                e.preventDefault();
                this.parentElement.classList.toggle('active');
            }
        });
    });

    // Highlight current page in navigation
    const currentPage = window.location.pathname.split('/').pop() || 'index.html';
    const navLinks = document.querySelectorAll('.nav-menu a');
    
    navLinks.forEach(link => {
        const linkPage = link.getAttribute('href');
        if (linkPage === currentPage || 
            (currentPage === '' && linkPage === 'index.html') ||
            (currentPage === '/' && linkPage === 'index.html')) {
            link.classList.add('active');
        } else {
            // Remove lingering active classes from hardcoded HTML
            link.classList.remove('active'); 
        }
    });

    // To handle dropdown parent being active if a child is active
    if (currentPage !== 'index.html' && currentPage !== 'compiler.html' && currentPage !== 'programs.html' && currentPage !== 'references.html' && currentPage !== 'about.html') {
        const dropdownItem = document.querySelector('.dropdown .dropdown-toggle');
        if (dropdownItem) dropdownItem.classList.add('active');
    }
});
