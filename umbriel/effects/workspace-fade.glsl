vec4 animation(vec2 uv) {
    return mix(
        umbriel_sample(uv),
        umbriel_sample_incoming(uv),
        umbriel_clamped_progress
    );
}
