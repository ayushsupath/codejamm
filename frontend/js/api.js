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
