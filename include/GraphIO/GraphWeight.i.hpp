/**
 * @author Federico Busato                                                  <br>
 *         Univerity of Verona, Dept. of Computer Science                   <br>
 *         federico.busato@univr.it
 * @date April, 2017
 * @version v1.3
 *
 * @copyright Copyright © 2017 cuStinger. All rights reserved.
 *
 * @license{<blockquote>
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * * Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 * </blockquote>}
 */
#include <cassert>

namespace graph {

//==============================================================================
////////////////////////////////
///        GRAPH WEIGHTS     ///
////////////////////////////////

template<typename vid_t, typename eoff_t, typename weight_t>
inline const eoff_t*
GraphWeight<vid_t, eoff_t, weight_t>::out_offsets() const noexcept {
    return _out_offsets;
}

template<typename vid_t, typename eoff_t, typename weight_t>
inline const eoff_t*
GraphWeight<vid_t, eoff_t, weight_t>::in_offsets_array() const noexcept {
    return _in_offsets;
}

template<typename vid_t, typename eoff_t, typename weight_t>
inline const vid_t*
GraphWeight<vid_t, eoff_t, weight_t>::out_edges() const noexcept {
    return _out_edges;
}

template<typename vid_t, typename eoff_t, typename weight_t>
inline const vid_t*
GraphWeight<vid_t, eoff_t, weight_t>::in_edges_array() const noexcept {
    return _in_edges;
}

template<typename vid_t, typename eoff_t, typename weight_t>
inline const typename GraphWeight<vid_t, eoff_t, weight_t>::degree_t*
GraphWeight<vid_t, eoff_t, weight_t>::out_degrees_array() const noexcept {
    return _out_degrees;
}

template<typename vid_t, typename eoff_t, typename weight_t>
inline const typename GraphWeight<vid_t, eoff_t, weight_t>::degree_t*
GraphWeight<vid_t, eoff_t, weight_t>::in_degrees_array() const noexcept {
    return _in_degrees;
}

template<typename vid_t, typename eoff_t, typename weight_t>
inline typename GraphWeight<vid_t, eoff_t, weight_t>::degree_t
GraphWeight<vid_t, eoff_t, weight_t>::out_degree(vid_t index) const noexcept {
    assert(index >= 0 && index < _nV);
    return _out_degrees[index];
}

template<typename vid_t, typename eoff_t, typename weight_t>
inline typename GraphWeight<vid_t, eoff_t, weight_t>::degree_t
GraphWeight<vid_t, eoff_t, weight_t>::in_degree(vid_t index) const noexcept {
    assert(index >= 0 && index < _nV);
    return _in_degrees[index];
}

template<typename vid_t, typename eoff_t, typename weight_t>
inline const weight_t*
GraphWeight<vid_t, eoff_t, weight_t>::out_weights_array() const noexcept {
    return _out_weights;
}

template<typename vid_t, typename eoff_t, typename weight_t>
inline const weight_t*
GraphWeight<vid_t, eoff_t, weight_t>::in_weights_array() const noexcept {
    return _in_weights;
}

} //namespace graph
