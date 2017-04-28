/**
 * @author Federico Busato                                                  <br>
 *         Univerity of Verona, Dept. of Computer Science                   <br>
 *         federico.busato@univr.it
 * @date April, 2017
 * @version v2
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
namespace cu_stinger_alg {

template<typename T>
Queue<T>::Queue(size_t max_allocated_items) noexcept {
    cuMalloc(_d_queue.first, max_allocated_items);
    cuMalloc(_d_queue.second, max_allocated_items);
    //cuMemcpyToSymbol(_d_queue, d_queue);
    //cuMemcpyToSymbol(xlib::make2(0, 0), d_queue_counter);
}

template<typename T>
inline Queue<T>::~Queue() noexcept {
    cuFree(_d_queue.first, _d_queue.second);
}

template<typename T>
__host__ void Queue<T>::insert(const T& item) noexcept {
    cuMemcpyToDeviceAsync(item, _d_queue.first);
}

template<typename T>
__host__ inline void Queue<T>::insert(const T* items_array, int num_items)
                                      noexcept {
    cuMemcpyToDeviceAsync(items_array, num_items, _d_queue.first);
    _size = num_items;
}

template<typename T>
__host__ int Queue<T>::size() const noexcept {
    return _size;
}
/*
template<typename Operator, typename... TArgs>
inline void Queue::traverseAndFilter(TArgs... args) noexcept {
    //static int level = 0;
    static int flag = 0;
    const int ITEMS_PER_BLOCK = xlib::SMemPerBlock<BLOCK_SIZE, id_t>::value;
    int grid_size = xlib::ceil_div<ITEMS_PER_BLOCK>(_num_queue_edges);
    if (PRINT_VERTEX_FRONTIER)
        xlib::printCudaArray(_d_queue1, _num_queue_vertices);
    //std::cout << level++ << "\t" << _num_queue_vertices << std::endl;

    loadBalancingExpandContract<ITEMS_PER_BLOCK, Operator>
        <<< grid_size, BLOCK_SIZE >>> (_num_queue_vertices + 1, args...);

    if (CHECK_CUDA_ERROR1)
        CHECK_CUDA_ERROR

    int2 frontier_info;
    cuMemcpyFromSymbolAsync(d_queue_counter, frontier_info);
    _num_queue_vertices = frontier_info.x;
    _num_queue_edges    = frontier_info.y;
    cuMemcpyToSymbolAsync(xlib::make2(0, 0), d_queue_counter);

    if (flag) {
        cuMemcpyToDeviceAsync(_num_queue_edges, _d_work1 + _num_queue_vertices);
        cuMemcpyToSymbolAsync(_d_queue1, d_queue1);
        cuMemcpyToSymbolAsync(_d_queue2, d_queue2);
        cuMemcpyToSymbolAsync(_d_work1, d_work1);
        cuMemcpyToSymbolAsync(_d_work2, d_work2);
    }
    else {
        cuMemcpyToDeviceAsync(_num_queue_edges, _d_work2 + _num_queue_vertices);
        cuMemcpyToSymbolAsync(_d_queue2, d_queue1);
        cuMemcpyToSymbolAsync(_d_queue1, d_queue2);
        cuMemcpyToSymbolAsync(_d_work2, d_work1);
        cuMemcpyToSymbolAsync(_d_work1, d_work2);
    }
    flag ^= 1;
}
*/

} // namespace cu_stinger_alg
